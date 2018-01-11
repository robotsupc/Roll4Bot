// Wheel of Roll4bot
// Authors: Arnau and Alberto.

radi_roda_extern = 60;
radi_roda_intern = 50;
n_radis = 8;

n_tacos = 36;

radi_eix_intern = 5;
radi_eix_extern = 10;

height_part_wheel = 5;
total_height = 15;

// diametro shaft = 5, diametro hasta el lado plano = 4.5
radi_shaft = 2.6;
flat_shaft = 0.55;

radi_radi = 5;


module partWheel() {
    
    translate([0,0,0]) {
        difference() {
            cylinder(h = height_part_wheel, r1 = radi_roda_extern, r2 = radi_roda_extern, $fn=60, centered = true);
            
            cylinder(h = height_part_wheel, r1 = radi_roda_intern, r2 = radi_roda_intern, $fn=60);
            
        }
    }

    for (i = [0 : 360/n_tacos: 360]) {
        
        rotate([90,0,0])
        rotate([0, i, 0])
        translate([0,0,radi_roda_extern-0.2])
        cube([5,5,5]);
    }
}

module partExterior(){
    for (i = [0 : 1 : (total_height / height_part_wheel) - 1]) {
       translate([0,0,height_part_wheel*i])
       rotate([0,0,360/n_tacos/2*i])
       partWheel();
    }
}

module radis() {
    for (i = [0 : 360/n_radis: 360]) {
        rotate([90,0,0])
        rotate([0, i, 0])
        translate([-radi_radi/2, 0, radi_eix_extern])
        cube([radi_radi, total_height, radi_roda_intern -           radi_eix_extern], centered=true);
        
   }
}

module partInterior() {
    difference(){
        
        cylinder(h = total_height, r1 = radi_eix_extern+2, r2 = radi_eix_extern+2, $fn=60);
        
        difference() {    
            translate([0,0,-total_height/2])
            cylinder(h = total_height*2, r1 = radi_shaft, r2 = radi_shaft      , $fn=60);
        
            translate([radi_shaft-flat_shaft,-radi_shaft, -total_height/2])
            cube([flat_shaft,radi_shaft*2, 30]);
        }
    }
}

union() {
    partExterior();
    radis(); 
    partInterior();
    
}