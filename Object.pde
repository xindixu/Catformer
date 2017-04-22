class Object{
  PVector pos;
  int i;
  PImage[] img;
  
  Object(PVector pos, int i, PImage[] img){
    this.pos = pos.copy();
    this.i = i;
    this.img = img;
  }
  
  void display(){
    image(img[i],pos.x,pos.y);
  }

}