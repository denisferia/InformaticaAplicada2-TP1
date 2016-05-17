Pincel[] modulado;

//Paleta colores;

PImage pinceles, pincel, mascara;

color cualColor;

void setup(){
  size(800,800);
  //colores =new Paleta("Paleta1.png");
  imageMode(CENTER);
  modulado = new Pincel[4];
  
  background(255);

}

void draw(){
  for(int i=0; i< modulado.length; i++){
    modulado[i] = new Pincel();
    modulado[i].mostrar();
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
}/*
