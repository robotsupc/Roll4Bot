xarduino=30.9;
yarduino=57.5;
xdriver=15;
ydriver=20;
xstepdown=26;
ystepdown=43.5;
forat=1.5;

module arduino(){
    difference(){
        cube([xarduino+2,yarduino+2,3],center=true);
        translate([(xarduino/2-1-forat),(yarduino/2-1-forat),0])
        cylinder(r=forat,h=4,$fn=20,center=true);
        translate([-(xarduino/2-1-forat),(yarduino/2-1-forat),0])
        cylinder(r=forat,h=4,$fn=20,center=true);
        translate([(xarduino/2-1-forat),-(yarduino/2-1-forat),0])
        cylinder(r=forat,h=4,$fn=20,center=true);
        translate([-(xarduino/2-1-forat),-(yarduino/2-1-forat),0])
        cylinder(r=forat,h=4,$fn=20,center=true);
    } 
}
module driver(){
    difference(){
        union(){
            difference(){
                cube([xdriver+4,ydriver+4,4],center=true);
                translate([0,0,1])
                cube([xdriver+1,ydriver+1,4],center=true);
                translate([0,0,2])
                cube([xdriver/2,ydriver+6,4],center=true);
                translate([0,0,-2])
                cube([xdriver-3,ydriver-3,4],center=true);
            }
            translate([0,ydriver/2+ydriver/5,-1])
            cube([xdriver/2,ydriver/5,2],center=true);
            translate([0,-(ydriver/2+ydriver/5),-1])
            cube([xdriver/2,ydriver/5,2],center=true);
        }
        translate([0,-(ydriver/2+3),0])
        cylinder(r=forat,h=10,center=true,$fn=20);
        translate([0,(ydriver/2+3),0])
        cylinder(r=forat,h=10,center=true,$fn=20);
    }
}
module driver_t(){
    difference(){
                cube([xdriver/2,ydriver+4+2*ydriver/5,2],center=true);
                translate([0,-(ydriver/2+3),0])
                cylinder(r=forat,h=10,center=true,$fn=20);
                translate([0,(ydriver/2+3),0])
                cylinder(r=forat,h=10,center=true,$fn=20);
        }
    
}
module p_driver(){
    driver();
    translate([0,0,1])
    driver_t();
}

module step(){
    difference(){
        cube([xstepdown+2,ystepdown+2,3],center=true);
        translate([(xstepdown/2-2.5-forat),(ystepdown/2-6.5-forat),0])
        cylinder(r=forat,h=4,$fn=20,center=true);
        translate([-(xstepdown/2-7.5-forat),-(ystepdown/2-6.5-forat),0])
        cylinder(r=forat,h=4,$fn=20,center=true);
    } 
}
module sup_montat(){
    arduino();
    translate([xarduino/2+xdriver/2+3,yarduino/2-1-forat,-3.5])
    rotate([0,0,90])
    p_driver();
    translate([-(xarduino/2+xdriver/2+3),yarduino/2-1-forat,-3.5])
    rotate([0,0,90])
    p_driver();
    translate([xarduino/2+xdriver/2+3,-(yarduino/2-1-forat),-3.5])
    rotate([0,0,90])
    p_driver();
    translate([-(xarduino/2+xdriver/2+3),-(yarduino/2-1-forat),-3.5])
    rotate([0,0,90])
    p_driver();
    
}
sup_montat();