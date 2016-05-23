class Pincel
{
  color c;
  int xPos;
  float yPos;
  int ancho = 400;
  int alto = 340;

  /***Posiciones de pinceles en sprite**/
  int xp[] = {  
    0, 0, 0
  };
  int yp[] = {  
    0, 340, 680
  };
  int cantidad =yp.length;

  float tamanio;
  int escala;
  /*****/
  String estado;
  

  Pincel()
  {
    //posicion en pantalla
    xPos = 0;
    yPos = int(random(height));
    //ubicacion en sprite
    int cual = int(random(cantidad));
    println("cantidad"+cantidad);
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
    estado = "espera";
  }
  //estado para ejecutar pinceles de acuerdo a la presencia de sonido
  void actualizar( boolean estimulo, float tamanioNorm ) {
    if ( estado.equals( "espera" )) {
      if ( estimulo ) {
        estado = "traza";
        tamanio = tamanioNorm;
        println("tamanio: "+tamanio);
        mostrar(tamanio);
      }
    } else if ( estado.equals( "traza" )) {
      if ( !estimulo ) {
        
        estado = "espera";
      }
    }
//    actualizar();
  }

  void mostrar(float tamanioNorm) {
    //this.c = c;
    tint(200);
    
    escala = int(pincel.height * tamanioNorm);
    println("escala: "+escala);
    //pincel.resize( escala, escala);
    image(pincel, random(width), yPos, escala, escala);
  }
}