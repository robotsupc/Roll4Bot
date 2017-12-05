x=150;
y=250;
z=20;
altura=42; //stepper
radi=10;
f_tornillo=1.8;
rosca=2;
es_forats=10;
rosca=2;

piu = 1.6;
forat_piu = 3;

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
            translate([radi/2,y/2-radi/2])
                circle(f_tornillo,$fn=20);
            translate([-radi/2,y/2-3*radi/2])
                circle(f_tornillo,$fn=20);
            translate([radi/2,-y/2+radi/2])
                circle(f_tornillo,$fn=20);
            translate([-radi/2,-y/2+3*radi/2])
                circle(f_tornillo,$fn=20);
                for(i=[0:2*es_forats:y/2-2*radi-1]){
                    translate([0,i])
                    circle(f_tornillo,$fn=20);
                    translate([0,-i])
                    circle(f_tornillo,$fn=20);
                }
            }
        }
   
    translate([-radi,y/2-2*radi-z,0])
    cube([2*radi,2*radi+z,z/3]);
    
    translate([-radi,y/2-2*radi-z,2*z/3])
    cube([2*radi,2*radi+z,z/3]);
    
    translate([-radi,-y/2,0])
    cube([2*radi,2*radi+z,z/3]);
    
    translate([-radi,-y/2,2*z/3])
    cube([2*radi,2*radi+z,z/3]);
    }
}

module part2(){
    difference(){
        linear_extrude(z){
            difference(){
                hull(){
                    translate([x/2-radi,0])
                    cantonada();
                    translate([-x/2+radi,0])
                    rotate([0,0,90])
                    cantonada();
                }
                translate([x/2-radi/2,radi/2])
                        circle(f_tornillo,$fn=20);
                translate([x/2-3*radi/2,-radi/2])
                        circle(f_tornillo,$fn=20);
                translate([-x/2+radi/2,radi/2])
                        circle(f_tornillo,$fn=20);
                translate([-x/2+3*radi/2,-radi/2])
                        circle(f_tornillo,$fn=20);
            }
        } 
    
    translate([x/2-2*radi-z,-radi,z/3])
    cube([2*radi+z,2*radi,z/3]);
    translate([-x/2,-radi,z/3])
    cube([2*radi+z,2*radi,z/3]);


    
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
    difference(){
        union(){
            translate([x/2-z,y/2-z-2*radi,0])
            cube([2*radi,2*radi,z/3]);
            translate([x/2-z,y/2-z-2*radi,2*z/3])
            cube([2*radi,2*radi,z/3]);
        }
         for(i=[0:2*es_forats:y/2-2*radi-1]){
                    translate([x/2-z/2,i,-1])
                    cylinder(r=f_tornillo,h=z+2,$fn=20);
                }
    }
    difference(){
        union(){
            translate([-x/2,-y/2+2*radi,0])
            cube([2*radi,2*radi,z/3]);
            translate([-x/2,-y/2+2*radi,2*z/3])
            cube([2*radi,2*radi,z/3]);
        }       
        for(i=[0:2*es_forats:y/2-2*radi-1]){
            translate([-x/2+z/2,-i,-1])
            cylinder(r=f_tornillo,h=z+2,$fn=20);
       }
    }
    difference(){
        union(){
            translate([-x/2,y/2-z-2*radi,0])
            cube([2*radi,2*radi,z/3]);
            translate([-x/2,y/2-z-2*radi,2*z/3])
            cube([2*radi,2*radi,z/3]);
        }
         for(i=[0:2*es_forats:y/2-2*radi-1]){
            translate([-x/2+z/2,i,-1])
            cylinder(r=f_tornillo,h=z+2,$fn=20);
       }
    }
    difference(){
        union(){
            translate([x/2-z,-y/2+2*radi,0])
            cube([2*radi,2*radi,z/3]);
            translate([x/2-z,-y/2+2*radi,2*z/3])
            cube([2*radi,2*radi,z/3]);
        }
         for(i=[0:2*es_forats:y/2-2*radi-1]){
                    translate([x/2-z/2,-i,-1])
                    cylinder(r=f_tornillo,h=z+2,$fn=20);
                }
        
    }
   
    translate([x/2-2*z,y/2-2*radi,z/3])
    cube([2*radi,2*radi,z/3]);
    
    translate([-x/2+z,y/2-2*radi,z/3])
    cube([2*radi,2*radi,z/3]);
    
    translate([x/2-2*z,-y/2,z/3])
    cube([2*radi,2*radi,z/3]);
    
    translate([-x/2+z,-y/2,z/3])
    cube([2*radi,2*radi,z/3]);
}

module columna(){
    linear_extrude(altura){
        difference(){
            union(){
                rotate(180)
                cantonada();
                square(radi);
                translate([0,-radi])
                square(radi);
            }
            translate([radi/2,radi/2])
            circle(f_tornillo,$fn=20);
            translate([-radi/2,-radi/2])
            circle(f_tornillo,$fn=20);
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
    translate([0,0,altura+z])
    base_1();
    translate([-x/2+radi,y/2-radi,z])
    columna();
    translate([x/2-radi,y/2-radi,z])
    rotate([0,0,-90])
    columna();
    translate([-x/2+radi,-y/2+radi,z])
    rotate([0,0,90])
    columna();
    translate([x/2-radi,-y/2+radi,z])
    rotate([0,0,180])
    columna();
}


module sup_mot(){
    translate([radi/2,radi,0])
        linear_extrude(altura){
            rotate(180){
            circle(radi);
            square(radi);
            translate([-radi,0])
            square(radi);
        }
    }
    translate([radi/2,-35,altura/2]){
        difference(){
            cube([radi,70,altura],center = true);
            rotate([0,90,0])
            cylinder(r=12,h=2*radi+1,center = true);
            
            
            translate([0,15.5,15.5])
            rotate([0,90,0])
            cylinder(r=f_tornillo,h=2*radi+1, $fn=20,center = true);    
            
            translate([0,15.5,-15.5])
            rotate([0,90,0])
            cylinder(r=f_tornillo,h=2*radi+1, $fn=20,center = true);   
            
            translate([0,-15.5,15.5])
            rotate([0,90,0])
            cylinder(r=f_tornillo,h=2*radi+1, $fn=20,center = true);   
            
            translate([0,-15.5,-15.5])
            rotate([0,90,0])
            cylinder(r=f_tornillo,h=2*radi+1, $fn=20,center = true); 

            translate([0,30,0])
            cylinder(r=f_tornillo,h=altura+1, $fn=20,center = true); 
            translate([0,-30,0])
            cylinder(r=f_tornillo,h=altura+1, $fn=20,center = true); 
            
            translate([0,30,0])
            cube([2*radi+1,10,20],center = true);
            
            translate([0,-30,0])
            cube([2*radi+1,10,20],center = true);
        }
    }
}
module im_base(){
    translate([10,10,0])
    rotate([0,90,45])
    part1();
    translate([-10,-10,0])
    rotate([0,90,45])
    part1();
    translate([30,30,0])
    rotate([-90,0,-45])
    part2();
    translate([-30,-30,0])
    rotate([-90,0,-45])
    part2();
}
sup_mot();