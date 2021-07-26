class Trian extends Shape {
  float _edge;

  Trian() {
    this(100);
  }

  Trian(float edge) {
    setEdge(edge);
  }
 

  @Override
  void aspect() {
    triangle(0,0,edge(),edge(),2*edge(),0);
  }
  
  @Override
  void reflex(){
    triangle(0,0,edge(),-edge(),2*edge(),0);
  }
  
  public float edge() {
    return _edge;
  }

  public void setEdge(float edge) {
    _edge = edge;
  }
  
}
