class Flag{
  
  PVector pos = new PVector();
  int size;
  int numFrames = 10;
  PImage[] flags = new PImage[numFrames];
  int currentFrame = 0;
  int animationTimer = 0;
  int animationTimerValue = 80;
  
  //constructor
  Flag(PVector loc, int _s){
    this.pos = loc;
    this.size = _s;
    
    for(int i = 0; i < flags.length; i++){
      String imageName = "flag/flag_"+nf(i+1, 2) +".png";
      flags[i] = loadImage(imageName);
      flags[i].resize(size+2,size);
    }
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