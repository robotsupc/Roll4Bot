x=150;
y=250;
z=20;
altura=42; //stepper
radi=10;
f_tornillo=1.8;
rosca=2;
es_forats=10;
rosca=2;

piu = 2.9;
forat_piu = 3.15;


module sup_mot(){
    difference() {
        
    union(){
    difference() {
        
    translate([radi/2,radi,0]) {
        linear_extrude(altura){
            rotate(180){
            circle(radi);
            square([radi, 10]);
            translate([-radi,0])
            square([radi, 10]);
            }
        }
    }
    translate([radi/2, 12.5, -1])
    cylinder(r=forat_piu, h=60, $fn=20);
}
   

    translate([radi/2,-35,altura/2]){
        difference(){
            cube([radi*2,70,altura],center = true);
            translate([(radi/2)-2.5,0,0])
            cube([radi+5,43,altura],center = true);
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

            
            translate([0,-30,0])
            cylinder(r=f_tornillo,h=altura+1, $fn=20,center = true); 
            
            
            translate([0,-30,0])
            cube([2*radi+1,10,15],center = true);
        }
    }
    translate([-radi/2,-75,0])
    cube([2*radi, 5, altura]);
}
    translate([radi/2, -2.5, -1])
    cylinder(r=forat_piu, h=60, $fn=20);
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