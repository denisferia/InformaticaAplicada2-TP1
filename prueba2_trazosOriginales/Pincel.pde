class Pincel
{
  color c;
  int xPos;
  float yPos;

  PImage trazos, mascara;
  
  int pagina;
  String estado;
  String nombreArchivo;

  Pincel(String nombreArchivo)
  {

    xPos = 0;
    this.nombreArchivo= nombreArchivo;
    
    trazos=loadImage(nombreArchivo);
    mascara=loadImage(nombreArchivo);
    trazos.filter(INVERT);
    mascara.filter(INVERT);
    trazos.mask(mascara);
    estado = "espera";
  }
  //estado para ejecutar pinceles de acuerdo a la presencia de sonido
  void actualizar( boolean estimulo ) {
    if ( estado.equals( "espera" )) {
      if ( estimulo ) {
        estado = "traza";
        mostrar();
      }
    } else if ( estado.equals( "traza" )) {
      if ( !estimulo ) {
        estado = "espera";
      }
    }
//    actualizar();
  }

  void mostrar() {
    //this.c = c;
    tint(200);
    yPos = int(random(height));
    image(trazos, 0, yPos);
  }
}
