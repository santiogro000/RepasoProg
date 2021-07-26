class Rombo extends Shape {
  float _edge;
  float secondedge = (sqrt(2)*edge())-edge();
  Rombo() {
    this(100);
  }

  Rombo(float edge) {
    setEdge(edge);
  }
 

  @Override
  void aspect() {
    quad(0,0,edge(),-edge(),3*edge(),-edge(),2*edge(),0);
  }
  
  @Override
  void reflex(){
    quad(0,0,-edge(),-edge(),-3*edge(),-edge(),-2*edge(),0);
  }
  
  public float edge() {
    return _edge;
  }

  public void setEdge(float edge) {
    _edge = edge;
  }
  
}
