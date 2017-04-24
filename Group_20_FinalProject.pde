import ddf.minim.*;
import java.util.Map;

Sprite a,sa;
Enemy zb,zg;

Score s;

static Timer t;
static PImage bg,heart;
static PImage[] plfImg,btnImg;
static boolean left,right,up,down,mouse;

Enivornment en;

void setup(){
  size(1600,750);
  frameRate(60);
  
  en = new Enivornment();
  en.setupEnv();   
  
  t = new Timer();
  left = false; right = false; up = false; down = false;
}

void draw(){
  en.display();
  en.detectBttn();
  en.bttnAct();
  
  if(en.currentScreen == "Home"){
    // display home screen
  }
  else if(a.lives > 0 && en.currentScreen == "Game"){
    if(a.currentState == "Dead"){
      en.resetCoins();
    }
    t.update();
    t.display();
    a.update();
    a.display();
    //zb.update();
    //zb.display();
    zg.update();
    zg.display();
    if(en.detectFlag()){
      a.reset();
      //zb.reset();
      zg.reset();
      switch(en.currentScene){
        case "forest":
          en.setScene("winter");
          break;
        case "winter":
          en.setScene("desert");
          break;
        case "desert":
          en.setScene("graveyard");
          break;
        case "graveyard":
          en.setScreen("Win");
          break;
      }
    }
    if(en.currentScene == "graveyard"){
      zb.update();
      zb.display();
    }
    if(en.currentScene == "winter"){
      sa.update();
      sa.display();
    }
  }
  
  else if(en.currentScreen == "Win"){
      en.getScreen("Win").updateText(2,str(s.score+5*a.lives+10-int(t.frameCnt/240)));
  }
  else if(en.currentScreen == "Pause"){
    // pause
  }
  else if(en.currentScreen == "Info"){
    // pause and display info
    en.getScreen("Info");
  }
  else{
    en.setScreen("Lose");
    en.getScreen("Lose").updateText(2,str(s.score+5*a.lives+10-int(t.frameCnt/240)));
  }
  
}


void mousePressed(){
  mouse = true;
}
void mouseReleased(){
  mouse = false;
}

void keyPressed(){
  switch (keyCode){
    case 37://left
      left = true;
      break;
    case 39://right
      right = true;
      break;
    case 38: //up
      up = true;
      break;
    case 40://down
      down = true;
      break;
  }
}


void keyReleased(){
  switch (keyCode){
    case 37://left
      left = false;
      break;
    case 39://right
      right = false;
      break;
    case 38://up
      up = false;
      break;
    case 40://down
      down = false;
      break;
  }
}