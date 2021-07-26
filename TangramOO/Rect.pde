class Rect extends Shape {
  float _edge;

  Rect() {
    this(100);
  }

  Rect(float edge) {
    setEdge(edge);
  }
 

  @Override
  void aspect() {
    rectMode(CENTER);
    rect(0, 0, edge(), edge());
  }
  
  @Override
  void reflex(){
    rectMode(CENTER);
    rect(0, 0, edge(), edge());
  }
  
  public float edge() {
    return _edge;
  }

  public void setEdge(float edge) {
    _edge = sqrt(2)*edge;
  }
  
}
