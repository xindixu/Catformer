class Coins{
  PVector pos = new PVector();
  int size;
  int numFrames = 21;
  PImage[] coins = new PImage[numFrames];
  int currentFrame = 0;
  int animationTimer = 0;
  int animationTimerValue = 65;
  boolean got;
  
  //constructor
  Coins(PVector loc, int _size){
    this.pos = loc;
    this.size = _size;
    this.got = false;
    
    for(int i = 0; i < coins.length; i++){
      String imageName = "coin/coin_"+nf(i+1, 2) +".png";
      coins[i] = loadImage(imageName);
      coins[i].resize(size+2,size);
    }
  }
  
  //returns the position vector of a coin
  PVector getPos(){
    return pos;
  }
  
  
  
  //displays the animated coin object
  void display(){
    if((millis() - animationTimer) >= animationTimerValue){
      currentFrame = (currentFrame + 1) % numFrames;
      animationTimer = millis();
    }
    
    if(!got){
      imageMode(CENTER);
      image(coins[currentFrame], pos.x, pos.y);
      imageMode(CORNER);
      //ellipse(pos.x,pos.y,5,5); 
    }
  }
}