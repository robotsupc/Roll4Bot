x=150;
y=250;
z=20;
altura=42; //stepper
radi=10;
f_tornillo=1.8;
rosca=2;
es_forats=10;
rosca=2;
module cantonada (){
    square(radi);
    circle(radi);
}

module part1(){
    difference(){
    linear_extrude(z){
            difference(){
            hull(){
                translate([0,y/2-radi])
                cantonada();
                translate([0,-y/2+radi])
                rotate([180])
                cantonada();
            }  
                for(i=[0:2*es_forats:y/2-2*radi-altura-4]){
                    translate([0,i])
                    circle(f_tornillo,$fn=20);
                    translate([0,-i])
                    circle(f_tornillo,$fn=20);
                }
            }
        }
    }
}

module part2(){
    difference(){
        linear_extrude(z){
                hull(){
                    translate([x/2-radi,0])
                    cantonada();
                    translate([-x/2+radi,0])
                    rotate([0,0,90])
                    cantonada();
                }
        } 
    }
}
module centre(){      
    difference(){  
        union(){
            hull(){
                    translate([x/2-z-2*radi,y/2-z-2*radi,0])
                    cube(z);
                    translate([-x/2+2*radi,-y/2+2*radi,0])
                    cube(z);
            }
            hull(){
                    translate([x/2-2*radi-z,-y/2+2*radi,0])
                    cube(z);
                    translate([-x/2+2*radi,y/2-2*radi-z,0])
                    cube(z);
            }
        } 
    }      
}
module base_1(){
    translate([x/2-radi,0,0])
    mirror([1,0,0])
    part1();
    translate([-x/2+radi,0,0])
    part1();
    translate([0,y/2-radi,0])
    mirror([0,1,0])
    part2();
    translate([0,-y/2+radi,0])  
    part2();
    centre();
}


module base_2(){
    base_1();
    translate([-x/2,-y/2+2*radi,z])
    sup_mot();
    translate([x/2,-y/2+2*radi,z])
    mirror([1,0,0])
    sup_mot();
    translate([x/2-2*radi,y/2-2*radi,z])
    mirror([0,1,0])
    sup_mot();
    translate([-x/2,y/2-2*radi,z])
    mirror([0,1,0])
    sup_mot();
}


module sup_mot(){
    difference(){
        cube([2*radi,altura+4.5,altura]);
        translate([-.5,20,altura/2])
        rotate([0,90,0])
        cylinder(r=12,h=2*radi+1);
        
        
        translate([-.5,5.5,5.5])
        rotate([0,90,0])
        cylinder(r=f_tornillo,h=2*radi+1, $fn=20);    
        
        translate([-.5,36.5,5.5])
        rotate([0,90,0])
        cylinder(r=f_tornillo,h=2*radi+1, $fn=20);   
        
        translate([-.5,5.5,36.5])
        rotate([0,90,0])
        cylinder(r=f_tornillo,h=2*radi+1, $fn=20);   
        
        translate([-.5,36.5,36.5])
        rotate([0,90,0])
        cylinder(r=f_tornillo,h=2*radi+1, $fn=20); 
    }
        translate([radi,-radi,0])
    linear_extrude(altura){
        cantonada();
        translate([-radi,0])
        square(radi);
        }
}
base_2();