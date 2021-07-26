Shape[] shapes;            //Arreglo booleanos
boolean drawGrid = true;   //Dibujo grilla
color colorpiece;          //Variable para verificar color
float rotationGrade = PI/4;//Variable para grado de rotacion
float edge = 62;           //Tamaño inicial del lado
PImage start;
PImage finish;
int screen=0;
PImage[] level;
int blackPixels = 500;
int errorRange = 100;

void setup() {                                                  
  size(1280, 720);                                              //Tamaño canvas
  shapes = new Shape[7];                                       //Areglo de figuras
  shapes[0] = new Rect(edge);                                  //Cuadrado
  shapes[1] = new Rombo(edge);                                 //Rombo
  shapes[2] = new Trian(edge);                                 //Triangulo Pequeño 1
  shapes[3] = new Trian(edge);                                 //Triangulo Pequeño 2
  shapes[4] = new Trian (2*edge);                              //Triangulo Grande 1
  shapes[5] = new Trian (2*edge);                              //Triangulo Grande 2
  shapes[6] = new Trian (sqrt(2)*edge);                        //Triangulo Mediano
  for (int i=0; i<shapes.length; i++) {                      
    if (shapes[i].getClass().equals(new Rect().getClass())) {  //Verifica si es un cuadrado al momento de asignar el espacio inicial
      shapes[i].setPosition(new PVector (20, i*100+20));
    } else {
      shapes[i].setPosition(new PVector (0, i*100));          //Asignacion inicial  para todas las figuras que no son cuadrados
    };
  }

  start = loadImage("start.png");
  level = new PImage[5];
  finish = loadImage("finish.png");

  for (int i=0; i<5; i++) {
    level[i] = loadImage("level_"+(i+1)+".png");
  }
}
/*--------------------------------------------------------------------------------------------------------------------------------------------------*/
void drawGrid(float scale) {                  //Funcion para el dibujo de la grilla
  push();
  strokeWeight(1);
  int i;
  for (i=0; i<=width/scale; i++) {
    stroke(0, 0, 0, 20);
    line(i*scale, 0, i*scale, height);
  }
  for (i=0; i<=height/scale; i++) {
    stroke(0, 0, 0, 20);
    line(0, i*scale, width, i*scale);
  }
  pop();
}

/*//***************************************************************************************************************************************************/

void draw() {
  screenSelector();
}

/*-------------------------------------------------------------------------------------------------------------------------------------------------*//*******************************************************************************************************************************************************/

void screenSelector() {
  if (screen == 0) {
    image(start, 0, 0);
  } else {
    drawlevel();
  }
}

/***************************************************************************************************************************************************/
void drawlevel() {  //Funcion para el dibujo inicial
  if (screen == 999) { 
    background(255, 255, 255);
    if (drawGrid)
      drawGrid(10);
    for (Shape shape : shapes)
      shape.draw();
      if (comprobation()) {
        image(finish, 0, 0);}
    } else {
      background(255, 255, 255);
      image (level[screen],0,0);
      if (drawGrid)
      drawGrid(10);
      for (Shape shape : shapes)
        shape.draw();
      if (comprobation()) {
        image(finish, 0, 0);
    }
  }
}
/*--------------------------------------------------------------------------------------------------------------------------------------------------*/
void mousePressed() {                         //Funciona para seleccionar la figura
  colorpiece = get(mouseX, mouseY);
  for (Shape shape : shapes) {
    shape.hover(colorpiece);
  }
}
/****************************************************************************************************************************************************/
void mouseDragged() {                          //Funcion para el movimiento de las figuras
  PVector position = new PVector(pmouseX, pmouseY);
  for (Shape shape : shapes) {
    if (shape.select()) {
      shape.setPosition(position);
      shape.draw();
    }
  }
}

/*******************************************************************************************************************************************************/

boolean comprobation() {
  blackPixels = 0;
  loadPixels();

  for (int i = 0; i <pixels.length; i++) {              // Analiza todo el arreglo en
    if (color(pixels[i]) == color(0)) {                 // busca de pixeles negros, si
      blackPixels++;                                    // hay se suma a Black_Pixels
    }
  }

  if ((blackPixels<=errorRange)&&(screen!=0)) {
    for (Shape shape : shapes) {                       // Deseleccion fichas
      if (shape.select()) {                         
        shape.unselect();
      }
    }
    return true;
  } else { 
    return false;
  }
}

/*******************************************************************************************************************************************************/
void keyPressed() {                //Interruptor de la grilla
  if (key == 'g' || key == 'G')
    drawGrid = !drawGrid;

  if (key == 'd' || key == 'D') { //Rotacion a la derecha
    for (Shape shape : shapes) {
      if (shape.select()) {
        shape.setRotation((shape.rotation()+(rotationGrade))%(PI*2));
        shape.draw();
      }
    }
  }
  if (key == 'a' || key == 'A') {         //Rotacion a la izquierda
    for (Shape shape : shapes) {
      if (shape.select()) {
        shape.setRotation((shape.rotation()-(rotationGrade))%(PI*2));
        shape.draw();
      }
    }
  }
  if ((key == 'w')||(key == 'W')|| (key == 's')||(key == 'S')) {       //Reflejar
    for (Shape shape : shapes) {
      if (shape.select()) {
        shape.changeReflex();
        shape.draw();
      }
    }
  }
  if (key == '+') {              //Incrementar el tamaño de las figuras
    for (Shape shape : shapes) {
      shape.setScaling(.01);
      shape.draw();
    }
  }
  if (key == '-') {            //Reducir el tamaño de las figuras
    for (Shape shape : shapes) {
      shape.setScaling(-.01);
      shape.draw();
    }
  }
  if ((key == 'r')||(key == 'R')) { //Reiniciar el nivel
    setup();
  }
  if ((key == 'm')||(key == 'M')) { //Menu
    screen = 0;
    screenSelector();
  }
  if ((key < 58)&&(key > 48)) {
    screen = key-48;
    screenSelector();
  }
  if (key == 'f'||key=='F') {
    screen = 999;
    screenSelector();
  }
}
