class Flag {

  PVector pos;
  int size;
  String name;
  int numFrames;
  State idle;

  //constructor
  Flag(PVector loc, int size, int numFrames, String name) {
    this.pos = loc;
    this.size = size;
    this.name = name;
    this.idle = new State(numFrames, "Idle");
    idle.loadImg("flag/"+name+"/Idle (", ").png", size);
  }  

  boolean detectFlag() {
    boolean re = false;
    if (abs(pos.x-a.pos.x) < size && abs(pos.y-a.pos.y) < size) {
      re = true;
    } else {
      re = false;
    }
    return re;
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    idle.display(false);
    popMatrix();
  }
}