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



Pincel[] modulado;

//Paleta colores;
PImage pinceles, pincel, mascara;
color cualColor;

void setup(){
  size(800,800);
  background(255);
  
  //colores =new Paleta("Paleta1.png");
  imageMode(CENTER);
  modulado = new Pincel[4];
  
  puerto = 12000;
  oscP5 = new OscP5( this , puerto ); // Entrada: mensajes de entrada por el puerto especificado
  // rangos de gestor de señal
  gestorFrec = new GestorSenial( MINIMO_ENTRADA_FRECUENCIA, 
  MAXIMO_ENTRADA_FRECUENCIA );
  gestorAmp = new GestorSenial( MINIMO_ENTRADA_AMPLITUD, 
  MAXIMO_ENTRADA_AMPLITUD );
  
    for(int i=0; i< modulado.length; i++){
    modulado[i] = new Pincel();
    }
  
}

void draw(){
  //actualizo el gestor de frecuencia con el valor de entrada
  gestorFrec.actualizar( inFrec );  
  gestorAmp.actualizar( inAmp );
  //transformo la intensidad de la voz en evento
  float valorAmplitud = gestorAmp.filtradoNorm();
  boolean estoyCantando = valorAmplitud > 0.2;
  
  gestorAmp.imprimir( 100, 300 );
  
  for(int i=0; i< modulado.length; i++){
    //modulado[i].mostrar();
    modulado[i].actualizar( estoyCantando );
    }
   

}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/datos")==true) {
    
    if (theOscMessage.checkTypetag("f")) {
      inFrec = theOscMessage.get(0).floatValue();
    }
    
  }else if (theOscMessage.checkAddrPattern("/vel")==true) {
    
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
