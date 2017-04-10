class Enemy{
   String name;
   String[] stateName = {"Attack", "Walk"};
   int[] frameCnt = {8,10};
   HashMap<String,State> states;
   PVector pos,vel,accel;
   PVector leftp, rightp, headp, bodyp;
   PVector target;
   float f,g;
   int size = 75;
   String currentState;
   String collisionSide;
   boolean ground, goRight;
   
   boolean attacked;

   
   Enemy(String name, PVector pos, PVector target){
     this.name = name;
     this.pos = pos.copy();
     this.vel = new PVector();
     this.accel = new PVector();
     this.leftp = new PVector();
     this.rightp = new PVector();
     this.headp = new PVector();
     this.bodyp = new PVector();
     this.f = 0.96;
     this.g = 0.3;
     this.ground = false;
     this.goRight = false;
     this.states = new HashMap<String, State>();
     this.currentState = "Walk";
     this.collisionSide = "None";
     this.target = target;
     this.attacked = false;
   }
 
   void setStates(){
     for (int i = 0; i < stateName.length; i++){
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
   
   void IsGround(){
     if(collisionSide.equals("Bottom")){
       ground = true;
     }
     else{
       ground = false;
     }
   }
   
   void GO(){
     if(currentState.equals("Walk")){
       if(goRight){
         accel.set(.125,0);
       }
       else{
         accel.set(-.125,0);
       }
     }
     if(currentState.equals("Attack")){
       if(goRight){
         accel.set(0,0);
         vel.set(0,0);
       }
       else{
         accel.set(0,0);
         vel.set(0,0); 
       }
     }
   }
     
   void chase(float Ledge, float Redge, PVector target){
     if(leftp.x <= Ledge && bodyp.y > 600){
         goRight = true;
     }
     if(rightp.x >= Redge -10){
         goRight = false;
     }
     if (abs(bodyp.y - target.y) <= 10){     
       if(bodyp.x < target.x){
         goRight = true;
       }
       if(leftp.x > target.x){
         goRight = false;
       }
     }
     if(abs(bodyp.x - target.x) <= 30 && abs(bodyp.y - target.y) <= 30 && !currentState.equals("Attack")){
       changeState("Attack");
       attacked = true;
     }
     
     if(attacked && getState("Attack").end){
       a.changeState("Dead");
       reset();
     }
   }
   
 
  void reset(){
    changeState("Walk");
    attacked = false;
    pos.set(400,400);
    goRight = false;
  }
     
  void updateBodyPos(){
    leftp.set(pos.x-size/4,pos.y-size/2);
    rightp.set(pos.x+size/4,pos.y-size/2);
    headp.set(pos.x,pos.y-size);  
    bodyp.set(pos.x,pos.y-size/2);
  }

  
  void update(){
    chase(0.0, 750.0, target);
    GO();
    IsGround();
    updateBodyPos();

    // apply friction & gravity
    if(ground){
      vel.set(vel.x*f,vel.y);
    }
    else{
      vel.set(vel.x*f,vel.y+g);
    }

    vel.add(accel);
    vel.set(constrain(vel.x,-2.5,2.5),constrain(vel.y,-5,10));
    
    pos.add(vel);
    pos.set(constrain(pos.x,0,width),constrain(pos.y,0,height));
    
        
    print(ground);
    println(collisionSide);
  }
  
  
  void display(){
    State temp = getState(currentState);
    if(goRight){
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
    //ellipse(leftp.x,leftp.y,10,10);
    //ellipse(rightp.x,rightp.y,10,10);
    //ellipse(headp.x,headp.y,10,10);
    //ellipse(bodyp.x,bodyp.y,10,10);
  }
}