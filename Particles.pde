class Particle{
  PVector pos;
  PVector vel;
  float life;
  
  Particle(PVector _pos){
    pos = _pos.copy();
    vel = new PVector(random(-3,3), random(0,5));
    //orient = _orient;
    life = 10;
  }
  void update(){
    vel.add(0,0.6);
    pos.add(vel);
    life -= 1.0;
  }
  
  void display(){
    stroke(#98A5AF);
    fill(#98A5AF,life+100);
    ellipse(pos.x,pos.y,3,3);
  }
 
  boolean isOff(){
    if (life < 0.0) {
      return true;
    }
    else{
      return false;
    }
  }
  
  void run(){
    update();
    display();
  }
}