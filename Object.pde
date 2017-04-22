class Object{
  PVector pos;
  int i;
  
  Object(PVector pos, int i){
    this.pos = pos.copy();
    this.i = i;
  }
  
  void display(){
    image(en.objImg[i],pos.x,pos.y);
  }

}