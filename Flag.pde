class Flag{
  
  PVector pos;
  int size;
  String name;
  int numFrames;
  State idle;
  
  
  //constructor
  Flag(PVector loc, int size, int numFrames, String name){
    this.pos = loc;
    this.size = size;
    this.idle = new State(numFrames,name);
  }
  
  void loadImg(){
    idle.loadImg("flag/");
  }
  //displays the animated flag object
  void display(){
    imageMode(CENTER);
    image(flags[currentFrame], pos.x, pos.y);
    imageMode(CORNER);
    if((millis() - animationTimer) >= animationTimerValue){
      currentFrame = (currentFrame + 1) % numFrames;
      animationTimer = millis();
    } 
    //ellipse(pos.x,pos.y,10,10);
  }
  
  
  
}