PImage pinceles, pincel, mascara;
int ancho = 250;
int alto = 70;
int xp[] = { 
  15, 10, 26, 17, 1, 3, 15, 270, 263, 276, 268, 271, 265
};
int yp[] = { 
  30, 87, 172, 248, 331, 417, 490, 16, 98, 192, 266, 355, 441
};
int cantidad =yp.length;

void setup() {
  size(500, 500);
  pinceles=loadImage("Imagen 3.png");
  pincel= createImage(250, 70, RGB);
  mascara= createImage(250, 70, RGB);
  background(255);
}

void draw() {

  int cual = int(random(cantidad));
  int nuevoX = xp[ cual ];
  int nuevoY = yp[ cual ];

  pincel.copy(pinceles, nuevoX, nuevoY, ancho, alto, 0, 0, ancho, alto);
  mascara.copy(pinceles, nuevoX, nuevoY, ancho, alto, 0, 0, ancho, alto);
  pincel.filter(INVERT);
  mascara.filter(INVERT);
  pincel.mask(mascara);
  tint(random(255), random(255), random(255)) ;
  image(pincel, random(width), random(height));
}

