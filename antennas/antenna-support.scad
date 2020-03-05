/* Medidas en milímetros*/
$fa = 1;
$fs = 0.4;
radio_interior=10.30;
radio_exterior=12.75;
ancho_cubo = radio_exterior - radio_interior;
altura_cilindro=10;
altura_cuerpo=50;
angulo=30;
//translate([0,-radio_interior,0])
difference(){
cylinder(r=radio_exterior,h=altura_cilindro);
cylinder(r=radio_interior,h=altura_cilindro);
}

rotate_extrude(angle = angulo ){
translate([radio_interior, 0, 0])
square([ancho_cubo,altura_cuerpo]);
}
rotate_extrude(angle = -angulo ){
translate([radio_interior, 0, 0])
square([ancho_cubo,altura_cuerpo]);
}

rotate_extrude(angle = angulo){
translate([-radio_exterior, 0, 0])
square([ancho_cubo,altura_cuerpo]);
}
rotate_extrude(angle = -angulo){
translate([-radio_exterior, 0, 0])
square([ancho_cubo,altura_cuerpo]);
}
translate([0, radio_interior, 0])
square([ancho_cubo,altura_cuerpo]);
/*
rotate_extrude(angle = angulo ){
translate([0,0,radio_interior])
square([ancho_cubo,altura_cuerpo]);
}
/*
rotate_extrude(angle = -angulo ){
translate([0,radio_interior,  0])
square([ancho_cubo,altura_cuerpo]);
}
*/
