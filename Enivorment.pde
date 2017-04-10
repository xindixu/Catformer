class Enivornment {
  PVector origin;
  float g;
  int w, h;
  int pfSize = 25;
  Flag flag;

  ArrayList<Platform> plf;
  ArrayList<Water> wtr;
  ArrayList<Coins> coinList;
 
  HashMap<String,Button> button;
  String[] buttonName = {"Start","Restart","Resume","Pause","Quit"};
  
  HashMap<String,Screen> screen;
  String[] screenName = {"Game","Pause","Win","Lose"};
  String currentScreen;
    
  Enivornment() {
    this.origin = new PVector(0,0);
    plf = new ArrayList();
    wtr = new ArrayList(); 
    coinList = new ArrayList();
    a = new Sprite("cat",new PVector(20,600));
    e = new Enemy("zombie", new PVector(500,500), a.pos);
    s = new Score(0);
    flag = new Flag(new PVector(825, 420), 75);

    screen = new HashMap<String,Screen>();
    button = new HashMap<String,Button>();

     
  }
  

  void setupEnv() {
    bg = loadImage("BG.png"); 
    plfImg = new PImage[18];
    loadAllPlf();
    a.setupStates();
    e.setStates();
    generateCoins();
    setupScreen();
    generateBttn();
    setScreen("Game");
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
      a.pos.set(20,600);
      a.vel.set(0,0);
      a.acc.set(0,0);
      resetCoins();
      s.resetScore();
      t.resetTime();
      a.lives = 3;
      e.reset();
    }

  }
  
  
  //Coin Implementation
  //generate the coins in the game
  void generateCoins(){
    for(int i = 0; i < 8; i++){
      coinList.add(new Coins(new PVector(150+50*i,675), 15));
    }
    
    for(int i = 0; i < 3; i++){
      coinList.add(new Coins(new PVector(120+50*i,250), 15));
      coinList.add(new Coins(new PVector(100+50*i,475), 15));
      coinList.add(new Coins(new PVector(300+50*i,125), 15));
      coinList.add(new Coins(new PVector(500+50*i,525), 15));
    }
    
  }
  
  //cycles through the arraylist of coins and displays them
  void displayAllCoins(){
    for (Coins c : coinList) {
      c.display();
    }
  }
  
  //detects if player is on coin and "collects" the coin
  void detectCoin(){ 
    for (int i = coinList.size() - 1; i >= 0; i--) {
      Coins coin = coinList.get(i);
      if(!coin.got && abs(coin.pos.x-a.pos.x) < 25 && abs(coin.pos.y-a.pos.y) < 30){
        s.incrementScore();
        coin.got = true;
      }
    }
  }
  
  //clears arraylist of coins and generates a new list and resets score to 0
  void resetCoins(){
    for (int i = coinList.size() - 1; i >= 0; i--) {
      Coins coin = coinList.get(i);
      coin.got = true;
    }
    generateCoins();
    s.resetScore();
  }
  
  
  boolean detectFlag(){
    if(abs(flag.pos.x-a.pos.x) < 25 && abs(flag.pos.y-a.pos.y) < 75){
       return true;
    }
    else{
      return false;
    }
  }
  
  // screen

  void setupScreen(){
  
    String[] pText = {"Pause","Click the button to resume the game."};
    PVector[] ppos = {new PVector(width/2,100),new PVector(width/2,130)};
    int[] pTxc = {color(0),color(0)};
    PFont[] pTxf = {createFont("Comic Sans MS Bold",32),createFont("Comic Sans MS Bold",20)};
    PVector[] pBttnPos ={new PVector(-30,200),new PVector(30,250),new PVector(30,300),new PVector(-30,350),new PVector(30,400)};
    
    String[] gText = {"Score:","Life:"};
    PVector[] gpos = {new PVector(10,20),new PVector(10,40)};
    int[] gTxc = {color(0),color(0)};
    PFont[] gTxf = {createFont("Comic Sans MS Bold",20),createFont("Comic Sans MS Bold",20)};
    PVector[] gBttnPos = {new PVector(-30,200),new PVector(30,250),new PVector(-30,300),new PVector(30,350),new PVector(30,400)};
    
    String[] wText = {"Congrats!","Your score:",""};
    PVector[] wpos = {new PVector(500,100),new PVector(500,130),new PVector(630,130)};
    int[] wTxc = {color(0),color(0),color(0)};
    PFont[] wTxf = {createFont("Comic Sans MS Bold",32),createFont("Comic Sans MS Bold",20),createFont("Comic Sans MS Bold",20)};
    PVector[] wBttnPos = {new PVector(-30,200),new PVector(30,250),new PVector(-30,300),new PVector(-30,350),new PVector(30,400)};
    
    
    String[] lText = {"Loser!","Your score:",""};
    PVector[] lpos = {new PVector(width/2,100),new PVector(width/2,130),new PVector(630,130)};
    int[] lTxc = {color(0),color(0),color(0)};
    PFont[] lTxf = {createFont("Comic Sans MS Bold",32),createFont("Comic Sans MS Bold",20),createFont("Comic Sans MS Bold",20)};
    PVector[] lBttnPos = {new PVector(-30,200),new PVector(30,250),new PVector(-30,300),new PVector(-30,350),new PVector(30,400)};
    
    Screen game = new Screen();
    Screen pause = new Screen();
    Screen win = new Screen(); 
    Screen lose = new Screen();
    
    game.construct(gText,gpos,gTxc,gTxf,bg,gBttnPos);
    pause.construct(pText,ppos,pTxc,pTxf,bg,pBttnPos);
    win.construct(wText,wpos,wTxc,wTxf,bg,wBttnPos);
    lose.construct(lText,lpos,lTxc,lTxf,bg,lBttnPos);
    
    
    screen.put("Game",game);
    screen.put("Win",win);
    screen.put("Lose",lose);
    screen.put("Pause",pause);
  }
  
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
  
  
  
  // platforms
  void generatePlf() {
    
    plf.add(new Platform_on_ground(new PVector(100, 500), 2, 1));
    plf.add(new Platform_on_ground(new PVector(100, 270), 6, 1));
    
    plf.add(new Platform_on_ground(new PVector(300, 400), 5, 2));
    plf.add(new Platform_on_ground(new PVector(300, 150), 4, 1));
    
    plf.add(new Platform_on_ground(new PVector(500, 250), 4, 1));
    plf.add(new Platform_on_ground(new PVector(500, 550), 4, 1));
    plf.add(new Platform_on_ground(new PVector(600, 400), 3, 1));
    plf.add(new Platform_on_ground(new PVector(700, 450), 6, 1));
    
    // ground
    plf.add(new Platform_on_ground(new PVector(0, 700), 20, 1));
    plf.add(new Platform_on_ground(new PVector(575,700), 3, 1));
    plf.add(new Platform_on_ground(new PVector(750,700), 10, 1));
    
    wtr.add(new Water(new PVector(675,700),2,1));
    wtr.add(new Water(new PVector(525,700),1,1));
  }

  void loadAllPlf() {
    generatePlf();
    for (int i = 0; i < plfImg.length; i ++) {
      plfImg[i] = loadImage("Tiles/"+(i+1)+".png");
      plfImg[i].resize(pfSize, pfSize);
    }
  }

  void displayAllPlf() {    
    for (Platform p : plf) {
      p.display();
      p.generateBoundaries();      
      detectCollision(a, p);
      detectCollision(e, p);
    }
    for (Water w : wtr) {
      w.display();
      w.generateBoundaries();      
      if(detectEdge(a,w) && !a.currentState.equals("Dead")){
        a.changeState("Dead");
        print(a.currentState);
      }
      if(detectEdge(e,w) && e.goRight){
        e.goRight = false;
      }
    }
  }
    
  
  void display() {
    //image(bg, origin.x, origin.y);
    //testing();
    getScreen(currentScreen).display();  
    if(currentScreen == "Game"){
      displayAllPlf();
      displayAllCoins();
      s.display();
      flag.display();
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
  }
}