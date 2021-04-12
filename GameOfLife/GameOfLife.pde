//Juego de la Vida de Conway
//Fuentes de consulta: Processing.org,Stackoverflow


boolean [][] CV;
int dimension = 10;/*Dimension, menor valor más cuadrados*/
int TA; /*Tamaño arreglo*/
float valorAleatorio = 0.5;/*Valor usado como criterio inicial del estado de las ceulas mayor valor, menor cantidad de celulas*/
boolean automatico=false; //Activa el refreso automatico, funciona con la tecla "a", mantener oprimido para efecto framexframe
boolean libre=false; //Activa un canvas blanco con la opcion de dibujar con el puntero
int fps = 5; // "+" sube los fps, "-" los baja
// Activa un juego aleatorio, funciona con la tecla "r"
// Activa el oscilador pulsar con la tecla "p"
// Activa las vidas estatica con la tecla "s"

void setup() {
  size(800, 800);
  TA = width/dimension;//Tamaño arreglo
  CV = new boolean[TA][TA]; //Celula Viva
  frameRate(fps);
  frame.setResizable(true);
}

void draw() {

  background(255);
  for (int i=0; i<TA; i++) {
    for (int j=0; j<TA; j++) {
      if (CV[i][j]) {
        fill(0);
        stroke(0);
      } else {
        noFill();
        noStroke();
      }
      rect(i*dimension, j*dimension, dimension-1, dimension-1);
    }
  }
  if (automatico){
    nuevaVida();
  }
}

void nuevaVida() {
  boolean [][] CV_new = new boolean [TA][TA];
  for (int i=0; i<TA; i++) {
    for (int j=0; j<TA; j++) {
      int contarVecinos = revisarVecinos(i, j);
      if (CV[i][j]){
        if(contarVecinos<2){
          CV_new[i][j]=false; //Muerte por soledad
        }
        else if (contarVecinos<4){
          CV_new[i][j]=true ;//Sobrevive
        }
        else {
          CV_new[i][j]=false;//Muerto por sobrepoblación < 3 vecinos
        }
    }else{
      if (contarVecinos == 3){
        CV_new[i][j]=true;//Nace celula
      }else{
        CV_new[i][j]=false;//Permanece muerta
        }
      }
    }
  }
  CV = CV_new;
}

int revisarVecinos (int i, int j) {
  int count = 0;
  if (CV[((i-1)+TA)%TA][j]) {count++;} //izquierda
  if (CV[((i-1)+TA)%TA][((j-1)+TA)%TA]) {count++;} //izquierda-abajo
  if (CV[((i-1)+TA)%TA][((j+1))%TA]) {count++;} //izquierda-arriba
  if (CV[i][((j+1))%TA]) {count++;} //arriba
  if (CV[i][((j-1)+TA)%TA]) {count++;} //abajo
  if (CV[(i+1)%TA][((j-1)+TA)%TA]) {count++;} //derecha abajo
  if (CV[(i+1)%TA][j]) {count++;} //derecha
  if (CV[(i+1)%TA][(j+1)%TA]) {count++;} //derecha arriba
  return count; //Retorna el valor total de vecinos
}

void juegoAleatorio() {
  for (int i=0; i<TA; i++) {
    for (int j=0; j<TA; j++ ) {
      if (random(1)<valorAleatorio) {
        CV[i][j]=false;
      } else {
        CV[i][j]=true;
      }
    }
  }
}

void pulsar(int i,int j){
 
 CV [5+i][3+i]=true;
 CV [6+i][3+j]=true;
 CV [7+i][3+j]=true;
 CV [11+i][3+j]=true;
 CV [12+i][3+j]=true;
 CV [13+i][3+j]=true;
 
 CV [3+i][5+j]=true;
 CV [8+i][5+j]=true;
 CV [10+i][5+j]=true;
 CV [15+i][5+j]=true;
 
 CV [3+i][6+j]=true;
 CV [8+i][6+j]=true;
 CV [10+i][6+j]=true;
 CV [15+i][6+j]=true;
 
 CV [3+i][7+j]=true;
 CV [8+i][7+j]=true;
 CV [10+i][7+j]=true;
 CV [15+i][7+j]=true;
 
 CV [5+i][8+j]=true;
 CV [6+i][8+j]=true;
 CV [7+i][8+j]=true;
 CV [11+i][8+j]=true;
 CV [12+i][8+j]=true;
 CV [13+i][8+j]=true;
 
 CV [5+i][10+j]=true;
 CV [6+i][10+j]=true;
 CV [7+i][10+j]=true;
 CV [11+i][10+j]=true;
 CV [12+i][10+j]=true;
 CV [13+i][10+j]=true;
 
 CV [3+i][11+j]=true;
 CV [8+i][11+j]=true;
 CV [10+i][11+j]=true;
 CV [15+i][11+j]=true;
 
 CV [3+i][12+j]=true;
 CV [8+i][12+j]=true;
 CV [10+i][12+j]=true;
 CV [15+i][12+j]=true;
 
 CV [3+i][13+j]=true;
 CV [8+i][13+j]=true;
 CV [10+i][13+j]=true;
 CV [15+i][13+j]=true;
 
 CV [5+i][15+j]=true;
 CV [6+i][15+j]=true;
 CV [7+i][15+j]=true;
 CV [11+i][15+j]=true;
 CV [12+i][15+j]=true;
 CV [13+i][15+j]=true;
}

void estatico(){
  CV [1][1]=true;
  CV [1][2]=true;
  CV [2][1]=true;
  CV [2][2]=true;
  
  CV [6][1]=true;
  CV [7][1]=true;
  CV [5][2]=true;
  CV [8][2]=true;
  CV [6][3]=true;
  CV [7][3]=true;
  
  CV [12][1]=true;
  CV [13][1]=true;
  CV [11][2]=true;
  CV [14][2]=true;
  CV [12][3]=true;
  CV [14][3]=true;
  CV [13][4]=true;
  
  CV [17][1]=true;
  CV [18][1]=true;
  CV [17][2]=true;
  CV [19][2]=true;
  CV [18][3]=true;
  
  CV [22][1]=true;
  CV [21][2]=true;
  CV [23][2]=true;
  CV [22][3]=true;
}



void keyPressed(){
  if (key == 'a' || key == 'A'){
    automatico = !automatico;
  }
  if (key == 'r' || key == 'R'){
    size(800, 800);
    TA = width/dimension;//Tamaño arreglo
    CV = new boolean[TA][TA]; //Celula Viva
    fps = 5;
    frameRate(fps);
    juegoAleatorio();//Genera un tablero aleatorio
    automatico = false;
    libre = false;
  }
  if (key == 'l' || key == 'L'){
    size(800, 800);
    TA = width/dimension;//Tamaño arreglo
    CV = new boolean[TA][TA]; //Celula Viva
    fps = 5;
    frameRate(fps);
    automatico = false;
    libre = true;
  }
  if (key == 'p' || key == 'P'){
    size(800, 800);
    TA = width/dimension;//Tamaño arreglo
    CV = new boolean[TA][TA]; //Celula Viva
    fps = 5;
    frameRate(fps);
    pulsar(31,31);
    automatico = false;
    libre = false;
  }
  if (key == 's' || key == 'S'){
    size(800, 800);
    TA = width/dimension;//Tamaño arreglo
    CV = new boolean[TA][TA]; //Celula Viva
    frameRate(fps);
    estatico();
    automatico = false;
    libre = false;
  }
  if (key == '+'){
    fps = fps+1;
    frameRate(fps);
  }
  if (key == '-'){
    if (fps-1 < 1){
      fps = 1;
      frameRate(fps);
    }
    else{
      fps = fps-1;
      frameRate(fps);
    }
  }
}

void mousePressed(){ //Dibujo libre para el usuario
  if (libre){
    CV [mouseX/dimension][mouseY/dimension] = !CV [mouseX/dimension][mouseY/dimension];
    }
}
