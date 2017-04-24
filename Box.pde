class Box{
  PImage img;
  PVector pos;
  String name;
  int size;
  
  Box(String name, int size){
    this.name = name;
    this.size = size;
    img = loadImage("GUI/box/"+name);
  }
 
}