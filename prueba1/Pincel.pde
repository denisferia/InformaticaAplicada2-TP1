class Pincel
{
  color c;
  int xPos;
  float yPos;
  int ancho = 400;
  int alto = 340;

  /***Posiciones de pinceles en sprite**/
  int xp[] = {  0, 0, 0};
  int yp[] = {  0, 340, 680};
  int cantidad =yp.length;
  /*****/
  


  Pincel()
  {
    //posicion en pantalla
    xPos = 0;
    yPos = int(random(height));
    //ubicacion en sprite
    int cual = int(random(cantidad));
    println(cual);
    int nuevoX = xp[ cual ];
    int nuevoY = yp[ cual ];
    pinceles=loadImage("trazos-manchas.jpg");
    pincel= createImage(400, 340, RGB);
    mascara= createImage(400, 340, RGB);
    pincel.copy(pinceles, nuevoX, nuevoY, ancho, alto, 0, 0, ancho, alto);
    mascara.copy(pinceles, nuevoX, nuevoY, ancho, alto, 0, 0, ancho, alto);
    pincel.filter(INVERT);
    mascara.filter(INVERT);
    pincel.mask(mascara);
    
  }

  void mostrar() {
    //this.c = c;
    tint(200);
      pincel.resize(pincel.width/2, pincel.height/2 );
      image(pincel, random(width), random(height));
  }
}

