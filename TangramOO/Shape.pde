// Implementar:
// 1. El estilo del shape (e.g., stroke, stroke weight).
// 2. El método contains(int x, int y) que diga si un punto de coordenadas
// (x,y) se encuentra o no al interior del shape. Observe que esta
// función puede servir para la selección de la pieza con un puntero.
// 3. El resto de shapes que se requieran para el Tangram, como se
// hace con la clase Rect (ver Rect.pde).

abstract class Shape {
  float _rotation;
  float _scaling;
  PVector _position;
  color _hue;
  boolean _selected = false;
  boolean _reflexstate = false;

  Shape() {
    this(new PVector(0,0),0,1,
         color(random(0, 255), random(0, 255), random(0, 255)));
  }

  Shape(PVector position, float rotation, float scaling, color hue) {
    setPosition(position);
    setRotation(rotation);
    setScaling(scaling);
    setHue(hue);
  }

  void draw() {
    push();
    fill(hue());
    translate(position().x, position().y);
    rotate(rotation());
    scale(scaling(), scaling());
    if (reflexstate()){
      reflex();
    }else{
    aspect();}
    pop();
  
  }
  abstract void aspect();
  abstract void reflex();
  
  float scaling() {
    return _scaling;
  }

  void setScaling(float scaling) {
    _scaling = _scaling+scaling;
  }

  float rotation() {
    return _rotation;
  }

  void setRotation(float rotation) {
    _rotation = rotation;
  }

  PVector position() {
    return _position;
  }

  void setPosition(PVector position) {
    _position = position;
  }

  color hue() {
    return _hue;
  }

  void setHue(color hue) {
    _hue = hue;
  }
  
  boolean select(){
    return _selected;
  }
  
  void hover (color piececolor){
   if (piececolor == _hue){
      _selected  = !_selected;
   }
   if ((piececolor != _hue)&&_selected){
      _selected = false;
   }
  }
  
  void unselect(){
    _selected = !_selected;
  }
  
  boolean reflexstate(){
    return _reflexstate;
  }
  
  void changeReflex(){
    _reflexstate = !_reflexstate;
  }
  
}
