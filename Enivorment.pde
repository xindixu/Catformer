class Enivornment {
  String name;
  float g;
  int w, h;
  int pfSize = 25;
  Flag flag,santa;
  PImage bg;
  PImage[] plfImg;
  PImage[] objImg;
 
  HashMap<String,Button> button;
  String[] buttonName = {"Start","Restart","Resume","Pause","Quit","Music","High_score","Info"};
  
  HashMap<String,Screen> screen;
  String[] screenName = {"Game","Pause","Win","Lose","Info","Home"};
  String currentScreen;
  
  HashMap<String,Scene> scene;
  String[] sceneName = {"forest","winter","desert","graveyard"};
  String currentScene;
    
  Enivornment() {
    a = new Sprite("cat",new PVector(20,600));
    zb = new Enemy("zombie", new PVector(1000,500), a.pos);
    zg = new Enemy("zombiegirl", new PVector(500,500), a.pos);
    
    s = new Score(0);
    flag = new Flag(new PVector(825, 420),50,10,"flag");
    santa = new Flag(new PVector(300, 200),50,10,"santa");
    
    screen = new HashMap<String,Screen>();
    button = new HashMap<String,Button>();
    scene = new HashMap<String,Scene>();     
  }
  

  void setupEnv() {
    a.setupStates();
    zb.setStates();
    zg.setStates();
    setupScreen();
    setupScene();
    generateBttn();
    setScreen("Game");
    setScene("forest");
  }
 
   
  // button
  void generateBttn(){
    for(int i = 0; i < buttonName.length; i ++){
      String n = buttonName[i];
      Button b = new Button(n);
      for(int j = 0; j < 3; j++){
        b.loadImg(n+" (",").png");
      }
      button.put(n,b);
    }
  }
  
  void displayBttn(){
     for(int i = 0; i < buttonName.length; i ++){
       String n = buttonName[i];
       Button b = button.get(n);
       b.display();
     }
  }
  
  void detectBttn(){
    for(int i = 0; i < buttonName.length; i ++){
       String n = buttonName[i];
       Button b = button.get(n);
       b.detect();
     }
  }
  
  void bttnAct(){
    Button pause = button.get("Pause");
    if(pause.status == "Clicked"){
      setScreen("Pause");
    }
    
    Button quit = button.get("Quit");
    if(quit.status == "Clicked"){
      exit();
    }
    
    Button resume = button.get("Resume");
    if(resume.status == "Clicked"){
      setScreen("Game");
    }
    
    Button restart = button.get("Restart");
    if(restart.status == "Clicked"){
      setScreen("Game");
      setScene("forest");
      a.reset();
      sa.reset();
      zb.reset();
      zg.reset();
      resetCoins();
      s.resetScore();
      t.resetTime();
      a.lives = 3;
    }
    
    Button info = button.get("Info");
    if(info.status == "Clicked"){
      setScreen("Info");
    }
  }


  
  // screen
  Screen getScreen(String name){
    return screen.get(name);
  }  
  
  void setScreen(String name){
    currentScreen = name;
    Screen s = getScreen(name);
    for(int i = 0; i < buttonName.length; i ++){
       String n = buttonName[i];
       Button b = button.get(n);
       b.update(s.buttonPos[i],1);
     }
  }
  
  // scene
  Scene getScene(String name){
    return scene.get(name);
  }
  
  void setScene(String name){
    currentScene = name;
    loadSceneImg();
    a.reset();
  }
  
   
  void loadSceneImg() {
    bg = loadImage("scene/"+currentScene+"/BG.png");
    plfImg = new PImage[18];
    for (int i = 0; i < 18; i ++) {
      plfImg[i] = loadImage("scene/"+currentScene+"/Tiles/"+(i+1)+".png");
      plfImg[i].resize(pfSize, pfSize);
    }
    
    Scene sc = getScene(currentScene);
    objImg = new PImage[sc.objName.length];
    int j = 0;
    for(String s:sc.objName){
      objImg[j] = loadImage("scene/"+currentScene+"/Objects/"+s+".png");
      j++;
    }
  }
  
  // platforms
  void displayAllPlf() {
    Scene sc = getScene(currentScene);
    for (Platform p : sc.plf) {
      p.display();
      p.generateBoundaries();      
      detectCollision(a, p);
      detectCollision(sa, p);
      detectCollision(zb, p);
      detectCollision(zg, p);
    }
    for (Water w : sc.wtr) {
      w.display();
      w.generateBoundaries();      
      if(detectEdge(a,w) && !a.currentState.equals("Dead")){
        a.changeState("Dead");
        sa.changeState("Dead");
        print(a.currentState);
        print(sa.currentState);
      }
      if(detectEdge(zb,w) && zb.goRight){
        zb.goRight = false;
      }
      if(detectEdge(zb,w) && zb.goRight == false){
        zb.goRight = true; 
      }
      if(detectEdge(zg,w) && zg.goRight){
        zg.goRight = false;
      }
    }
  }
  
  // coin
  void displayAllCoins(){
    Scene sc = getScene(currentScene);
    for(Coins c:sc.cn){
      if(!c.got && abs(c.pos.x-a.pos.x) < 25 && abs(c.pos.y-a.pos.y) < 75){
        s.incrementScore();
        c.got = true;
      }
      c.display();
    }
  }
  
  
  //clears arraylist of coins and generates a new list and resets score to 0
  void resetCoins(){
    Scene sc = getScene(currentScene);
    for(Coins c:sc.cn){
      c.got = false;
    }
    
  } 
   
   
  void display() {
    getScreen(currentScreen).display();  
    if(currentScreen == "Game"){
      displayAllPlf();
      displayAllCoins();
      s.display();
      flag.display();
      santa.display();
    }
    displayBttn();
  }
  
  // helper method
  float[] generateDistance(Sprite sp, Platform p){
    float dx = sp.bp.x - (p.b[0] + p.b[1])/2;
    float dy = sp.bp.y - (p.b[2] + p.b[3])/2;

    //ellipse((p.b[0] + p.b[1])/2, (p.b[2] + p.b[3])/2, 10, 10);
    //line(sp.bp.x, sp.bp.y, (p.b[0] + p.b[1])/2, (p.b[2] + p.b[3])/2);

    float chw = sp.size/4 +p.w/2;
    float chh = sp.size/2 +p.h/2;
    
    float[] re = {dx,dy,chw,chh};
    return re;
  }
  
  
  float[] generateDistance(Enemy sp, Platform p){
    float dx = sp.bodyp.x - (p.b[0] + p.b[1])/2;
    float dy = sp.bodyp.y - (p.b[2] + p.b[3])/2;

    //ellipse((p.b[0] + p.b[1])/2, (p.b[2] + p.b[3])/2, 10, 10);
    //line(sp.bodyp.x, sp.bodyp.y, (p.b[0] + p.b[1])/2, (p.b[2] + p.b[3])/2);

    float chw = sp.size/4 +p.w/2;
    float chh = sp.size/2 +p.h/2;
    
    float[] re = {dx,dy,chw,chh};
    return re;
  }
  
  boolean detectEdge(Sprite sp, Water w){
    //data = {dx,dy,chw,chh}    
    float[] data = generateDistance(sp,w);
    if (abs(data[0]) < data[2] && abs(data[1]) < data[3]) {
      return true;
    }   
    else{
      return false;
    }
  }


  boolean detectEdge(Enemy sp, Water w){
    //data = {dx,dy,chw,chh}    
    float[] data = generateDistance(sp,w);
    if (abs(data[0]) < data[2] && abs(data[1]) < data[3]) {
      return true;
    }   
    else{
      return false;
    }
  }

  void detectCollision(Sprite sp, Platform p) {
    //data = {dx,dy,chw,chh}
    float[] data = generateDistance(sp,p);
    
    if (abs(data[0]) < data[2]) {
      if (abs(data[1]) < data[3]) {
        float overlapX = data[2]-abs(data[0]);
        float overlapY = data[3]-abs(data[1]);

        if (overlapX >= overlapY) {          
          if (data[1] >0) {
            sp.collisionSide  = "Top";
            sp.pos.add(0, overlapY);
            sp.onland = false;
          } else {
            sp.collisionSide  = "Bottom";
            sp.pos.add(0, -overlapY);
            sp.onland = true;
          }
          sp.vel.set(sp.vel.x, 0);
        } else {
          if (data[0] > 0) {
            sp.collisionSide  = "Left";
            sp.pos.add(overlapX, 0);
          } else {
            sp.collisionSide  = "Right";
            sp.pos.add(-overlapX, 0);
          }
          sp.vel.set(0, sp.vel.y);
          sp.onland = false;
        }
      } else {
        // do not changes onland!!
        sp.collisionSide  = "None";
      }
    } else {
      sp.collisionSide  = "None";
    }
  }

  void detectCollision(Enemy sp, Platform p){
    //data = {dx,dy,chw,chh}
    float[] data = generateDistance(sp,p);
    
    if (abs(data[0]) < data[2]) {
      if (abs(data[1]) < data[3]) {
        float overlapX = data[2]-abs(data[0]);
        float overlapY = data[3]-abs(data[1]);

        if (overlapX >= overlapY) {          
          if (data[1] >0) {
            sp.collisionSide  = "Top";
            sp.pos.add(0, overlapY);
            sp.ground = false;
          } else {
            sp.collisionSide  = "Bottom";
            sp.pos.add(0, -overlapY);
            sp.ground = true;
          }
          sp.vel.set(sp.vel.x, 0);
        } else {
          if (data[0] > 0) {
            sp.collisionSide  = "Left";
            sp.pos.add(overlapX, 0);
          } else {
            sp.collisionSide  = "Right";
            sp.pos.add(-overlapX, 0);
          }
          sp.vel.set(0, sp.vel.y);
          sp.ground = false;
        }
      } else {
        // do not changes onland!!
        sp.collisionSide  = "None";
      }
    } else {
      sp.collisionSide  = "None";
    }
  }


  // method for testing all the tiles
  void testing() {
    for (int i = 0; i < plfImg.length; i ++) {
      image(plfImg[i], 0+i*52, 500);
      text((i+1), 0+i*52, 500);
    }
    for (int i = 0; i < objImg.length; i ++) {
      image(objImg[i], 0+i*52, 500);
      text((i+1), 0+i*52, 500);
    }
  }
}