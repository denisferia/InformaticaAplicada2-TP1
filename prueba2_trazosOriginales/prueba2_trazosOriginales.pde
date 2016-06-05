//importo Libreria osc
import oscP5.*;
import netP5.*;
//ojetos para recibr osc
OscP5 oscP5;
int puerto;
float inFrec; // vars de conversion dsd OSC
float inAmp;

//gestor señal
GestorSenial gestorFrec;
GestorSenial gestorAmp;

Pincel[] muchasModul;
Pincel[] pocasModul;
Pincel[] largas;
Pincel[] anchas;

/*Paleta colores;
 
 color cualColor;*/

void setup() {
  size(800, 800);
  background(255);

  //colores =new Paleta("Paleta1.png");
  imageMode(CENTER);
  muchasModul = new Pincel[14];
  //pocasModul = new Pincel[18];
  largas = new Pincel[18];
  //anchas = new Pincel[10];
  
  
  for (int i=0; i< muchasModul.length; i++) {
    String nombreArchivo = "A/img"+nf(i,3)+".jpg";
    
    muchasModul[i] = new Pincel(nombreArchivo);
  }
  println(muchasModul.length);
/*  for (int i=1; i<= pocasModul.length; i++) {
    pocasModul[i] = new Pincel(i);
  }*/
  
  for (int i=0; i< largas.length; i++) {
    String nombreArchivo = "C/img"+nf(i,3)+".jpg";
    largas[i] = new Pincel(nombreArchivo);
  }
/*  for (int i=1; i<= anchas.length; i++) {
    anchas[i] = new Pincel(i);
  }*/

  puerto = 12000;
  oscP5 = new OscP5( this, puerto ); // Entrada: mensajes de entrada por el puerto especificado
  // rangos de gestor de señal
  gestorFrec = new GestorSenial( MINIMO_ENTRADA_FRECUENCIA, 
  MAXIMO_ENTRADA_FRECUENCIA );
  gestorAmp = new GestorSenial( MINIMO_ENTRADA_AMPLITUD, 
  MAXIMO_ENTRADA_AMPLITUD );
}

void draw() {
  //actualizo el gestor de frecuencia con el valor de entrada
  gestorFrec.actualizar( inFrec );  
  gestorAmp.actualizar( inAmp );
  //transformo la intensidad de la voz en evento
  float valorAmplitud = gestorAmp.filtradoNorm();
  boolean estoyCantando = valorAmplitud > 0.1;

  gestorAmp.imprimir( 100, 300 );

  for (int i=1; i< muchasModul.length; i++) {
    //modulado[i].mostrar();
    muchasModul[i].actualizar( estoyCantando );
  }
}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/datos")==true) {

    if (theOscMessage.checkTypetag("f")) {
      inFrec = theOscMessage.get(0).floatValue();
    }
  } else if (theOscMessage.checkAddrPattern("/vel")==true) {

    if (theOscMessage.checkTypetag("f")) {
      inAmp = theOscMessage.get(0).floatValue();
    }
  }
}

/*
void eligePaleta(float amp) {
 
 if (amp >= 3){
 cualPaleta = "Paleta1.png";  
 } else if ( amp >= 2 && amp < 3 ) {
 cualPaleta = "Paleta2.png";
 } else if ( amp >= 1 && amp < 2 ) {
 cualPaleta = "Paleta3.png";
 } else if ( amp >= 0 && amp < 1 ) {
 cualPaleta = "Paleta4.png";
 }
 }
 
 void keyPressed() {
 if (key == CODED) {
 if (keyCode == UP) {
 cualColor=colores1.devolverColor();
 modulado1.mostrar(cualColor);
 } else if (keyCode == DOWN) {
 cualColor=colores2.devolverColor();
 modulado1.mostrar(cualColor);
 } else if (keyCode == LEFT) {
 cualColor=colores3.devolverColor();
 modulado1.mostrar(cualColor);
 }else if (keyCode == RIGHT) {
 cualColor=colores4.devolverColor();
 modulado1.mostrar(cualColor);
 }
 }
 }*/
