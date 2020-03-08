            /* Medidas en milímetros*/
$fa = 1;
$fs = 0.4;
wtotal=82;
htotal=62;
base_border=5;
minimo_viga=20;
wviga=wtotal-(minimo_viga*2);
hviga=htotal-(minimo_viga*2);
wsoporte=70;
/* Tornillo */
tornillo_r=4;
tornillo_h=10;
tornillo_wall=2;
tornillo_support=4;
tornillo_offset_x = 10;
tornillo_offset_y = 10;
/* Soporte SDR */
wsdr=20;
hsdr=80;
/* Ancho soporte sdr */
camasdr=base_border+0.5;
offset_sdr=13;

/* Base */

difference(){
translate([-wtotal/2,-htotal/2])
cube([wtotal,htotal,base_border]);
translate([-wviga/2,-hviga/2,0])
cube([wviga,hviga,base_border]);

translate([wtotal/2-tornillo_offset_x,htotal/2-tornillo_offset_y,0])
cylinder(r=tornillo_r-1,h=base_border);
translate([wtotal/2-tornillo_offset_x,-(htotal/2-tornillo_offset_y),0])
cylinder(r=tornillo_r-1,h=base_border);
translate([-(wtotal/2-tornillo_offset_x+1),htotal/2-tornillo_offset_y,0])
cylinder(r=tornillo_r-1,h=base_border);
translate([-(wtotal/2-tornillo_offset_x+1),-(htotal/2-tornillo_offset_y),0])
cylinder(r=tornillo_r-1,h=base_border);
    
}

/* Tornillo */
module tornillo(){
difference(){    
translate([0,0,tornillo_h])
rotate([0,180,0])
difference(){
    cylinder(r=tornillo_r,h=tornillo_h);
    cylinder(r=tornillo_r-tornillo_wall,h=tornillo_support);
    translate([0,0,tornillo_support])
    cylinder(r=tornillo_r-1,h=tornillo_h-tornillo_support);
}
}
}
translate([(wtotal/2-tornillo_offset_x),(htotal/2-tornillo_offset_y),0])
tornillo();
translate([-(wtotal/2-tornillo_offset_x+1),(htotal/2-tornillo_offset_y),0])
tornillo();
translate([-(wtotal/2-tornillo_offset_x+1),-(htotal/2-tornillo_offset_y),0])
tornillo();
translate([(wtotal/2-tornillo_offset_x),-(htotal/2-tornillo_offset_y),0])
tornillo();
/* Base del SDR */
translate([wtotal/2-5,-htotal/2 ,0])
cube([wtotal,htotal,base_border]);
/* Soporte del SDR*/
translate([wtotal/2,-(htotal/2-offset_sdr),0])
cube([wsoporte,13,camasdr   ]);
/* Pinza del SDR */
translate([wtotal/2,-(htotal/2-offset_sdr+5),0])
cube([5,5,20]);
translate([wtotal/2,-(htotal/2-offset_sdr-13),0])
cube([5,5,20]);
translate([wtotal/2+wsoporte-5,-(htotal/2-offset_sdr+5),0])
cube([5,5,20]);
translate([wtotal/2+wsoporte-5,-(htotal/2-offset_sdr-13),0])
cube([5,5,20]);

