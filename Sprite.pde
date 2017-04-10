// fix the prob: check on ground: landing after jumping 

class Sprite{
  String name;
  String[] stateName = {"Idle","Walk","Jump","Fall","Slide","Dead"};
  int[] frameCnt = {10,10,8,8,10,10};
  HashMap<String,State> states;
  PVector pos,vel,acc;
  //left hand pos, right hand pos, head pos
  PVector lhp,rhp,hp,bp;
  float f,g;
  int size = 75;
  String currentState;
  String collisionSide;
  boolean onland, headRight;
  int lives;
  
  Sprite(String name,PVector pos){
    this.name = name;
    this.pos = pos.copy();
    this.vel = new PVector();
    this.acc = new PVector();
    this.lhp = new PVector();
    this.rhp = new PVector();
    this.hp = new PVector();
    this.bp = new PVector();
    this.f = 0.96;
    this.g = 0.3;
    this.onland = false;
    this.headRight = false;
    this.states = new HashMap<String,State>();
    this.currentState = "Idle";
    this.collisionSide = "None";
    this.lives = 3;
    heart = loadImage("heart.png");
    heart.resize(10,10);
  }
  
  void setupStates(){
    for(int i = 0; i < stateName.length; i++){
      State temp = new State(frameCnt[i],stateName[i]);
      temp.loadImg(name+"/"+temp.name+" (",").png",size);
      states.put(temp.name,temp);
    }
  }
  
  State getState(String name){
    return states.get(name);
  }
  
  void changeState(String name){
    getState(currentState).end = false;
    currentState = name;   
    getState(name).end = false;  
  }
  
  
  void checkOnLand(){
    if(collisionSide.equals("Bottom")){
      onland = true;
    }
    else{
      onland = false;
    }
  }
  

  // change action depend on state
  void act(){
    if(currentState.equals("Walk")){
      if(headRight){
        acc.set(2,0);
      }
      else{
        acc.set(-2,0);
      }
    }
    if(currentState.equals("Idle")){
      acc.set(0,0);
    }
    if(currentState.equals("Slide")){
      if(headRight){
        acc.set(5,0);
      }
      else{
        acc.set(-5,0);
      }
    }
    if(currentState.equals("Jump")){
      vel.set(vel.x,-5);
      onland = false;
      if(getState("Jump").end){
        changeState("Fall");
      }
    }
    if(currentState.equals("Fall")){
      if(onland){
        changeState("Idle");
      }
    } 
    if(currentState.equals("Dead")){
      if(getState("Dead").end){
        changeState("Idle");
        lives -= 1;
        pos.set(20,600);
        vel.set(0,0);
        acc.set(0,0);
      }
    }
  }
  
  void control(){
    if(left && !currentState.equals("Dead")){
      changeState("Walk");
      headRight = false;
    }
    if(right && !currentState.equals("Dead")){
      changeState("Walk");
      headRight = true;
    }
    if(down && !currentState.equals("Dead")){
      changeState("Slide");
    }
    if(!left && !right && ! down && !currentState.equals("Jump") && !currentState.equals("Fall") && !currentState.equals("Dead")){
      changeState("Idle");
    }
    if(up && !currentState.equals("Jump")){
      changeState("Jump");
    }  
  }
  
  void updateBodyPos(){
    lhp.set(pos.x-size/4,pos.y-size/2);
    rhp.set(pos.x+size/4,pos.y-size/2);
    //if(currentState.equals("Slide")){
    //  hp.set(pos.x,pos.y-size/2);  
    //  bp.set(pos.x,pos.y-size/4);
    //}
    //else{
      hp.set(pos.x,pos.y-size);  
      bp.set(pos.x,pos.y-size/2);
    //}
  }

  
  void update(){
    control();
    act();
    checkOnLand();
    updateBodyPos();

    // apply friction & gravity
    if(onland){
      vel.set(vel.x*f,vel.y);
    }
    else{
      vel.set(vel.x*f,vel.y+g);
    }

    vel.add(acc);
    vel.set(constrain(vel.x,-5,5),constrain(vel.y,-10,10));
    
    pos.add(vel);
    pos.set(constrain(pos.x,0,width),constrain(pos.y,0,height));
    
  }
  
  
  void display(){
    State temp = getState(currentState);
    if(headRight){
      pushMatrix();
      translate(pos.x-size/2,pos.y-size);
      temp.display(false);
      popMatrix();
    }
    else{     
      pushMatrix();
      translate(pos.x-size/2,pos.y-size);
      scale(-1,1);
      temp.display(true);
      popMatrix();
    }
    
    // display the actual position / feet position
    //ellipse(pos.x,pos.y,10,10);
    //ellipse(lhp.x,lhp.y,10,10);
    //ellipse(rhp.x,rhp.y,10,10);
    //ellipse(hp.x,hp.y,10,10);
    //ellipse(bp.x,bp.y,10,10);
    
    
    // display lives
    for(int i = 0; i < lives; i ++){
      image(heart,60+20*i,30);
    }
  }

  
}