/* Medidas en milímetros*/
$fa = 1;
$fs = 0.4;
radio_interior=10.30;
radio_exterior=12.75;
chapa_superior=32;
chapa_ancho=5;
ancho_cubo = radio_exterior - radio_interior;
altura_cilindro=10;
altura_cuerpo=50;
angulo=30;
radio_agujero=8;
//translate([0,-radio_interior,0])

module cuerpo(){
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

//translate([-radio_exterior,radio_interior,0])
rotate([0,0,90-angulo])
rotate_extrude(angle = angulo ){
translate([radio_interior,0,0])
square([ancho_cubo,altura_cuerpo]);
}

//translate([-radio_exterior,radio_interior,0])
rotate([0,0,90])
rotate_extrude(angle = angulo ){
translate([radio_interior,0,0])
square([ancho_cubo,altura_cuerpo]);
}
}
cuerpo();
/* Chapa */
difference(){
translate([-chapa_superior/2,-chapa_superior/2,altura_cuerpo-chapa_ancho])
cube([chapa_superior,chapa_superior,chapa_ancho]);
translate([0, 0,altura_cuerpo-chapa_ancho])
cylinder(r=radio_interior,h=chapa_ancho);
}

module prisma_triangular(base,altura){
    vertices=[
        [0,0,0],
        [0,base,0],
        [base,0,0],
        [0,0,altura],
        [0,base,altura],
        [base,0,altura],
    ];
    caras=[
        [2,1,0],        
        [0,1,4,3],
        [0,3,5,2],
        [1,2,5,4],
        [3,4,5]
        
    ];
    polyhedron(points=vertices,
        faces=caras);
    
}

translate([-chapa_superior/2+chapa_ancho,chapa_superior/2,altura_cuerpo])
rotate([90,0,-90])
prisma_triangular(base=chapa_superior,altura=5);

translate([chapa_superior/2,chapa_superior/2,altura_cuerpo])
rotate([90,0,-90])
prisma_triangular(base=chapa_superior,altura=chapa_ancho);
/* Basee con agujero */
translate([-(chapa_superior/2),chapa_superior/2,altura_cuerpo])
rotate([90,0,0])
difference(){
cube([chapa_superior,chapa_superior,chapa_ancho]);
translate([chapa_superior/2,chapa_superior/2,0])    
cylinder(r=radio_agujero,h=chapa_ancho);  
}
