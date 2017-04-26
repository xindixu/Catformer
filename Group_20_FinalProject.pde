import ddf.minim.*;
//songs from http://ericskiff.com/music/
//victory and coin sound from https://opengameart.org/content/8-bit-sound-effects-library
//jump sfx from https://opengameart.org/content/8-bit-jump-1
import java.util.Map;

Minim minim;
AudioPlayer jump;

XML xml;
HighScore highscore;

Sprite a;
Enemy zb,zg,j;

Score s;

static Timer t;
static PImage bg,heart;
static PImage[] plfImg,btnImg;
static boolean left,right,up,down,mouse;

Enivornment en;

void setup(){
  size(1600,750);
  frameRate(60);
  
  minim = new Minim(this);
  jump = minim.loadFile("sounds/Jump.wav");
  
  xml = loadXML("score/highscores.xml");
  highscore = new HighScore(xml);
  
  en = new Enivornment();
  en.setupEnv();   
  en.music();
  
  t = new Timer();
  left = false; right = false; up = false; down = false;
}

void draw(){
  en.display();
  en.detectBttn();
  en.bttnAct();
  
    
  if(a.lives > 0 && en.currentScreen == "Game"){
    if(a.currentState == "Dead"){
      en.resetCoins();
    }
    t.update();
    t.display();
    a.update();
    a.display();
    zg.update();
    zg.display();
    j.update();
    j.display();
    j.jump();
    if(en.flag.detectFlag()){
      a.reset();
      zg.reset();
      switch(en.currentScene){
        case "forest":
          en.setScene("winter");
          en.music();
          break;
        case "winter":
          en.setScene("desert");
          en.music();
          break;
        case "desert":
          en.setScene("graveyard");
          en.music();
          break;
        case "graveyard":
          en.setScreen("Win");
          en.music();
          break;
      }
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
  else if(en.currentScreen == "Home"){
    en.getScreen("Home");
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
  if(keyCode == UP){
    jump.play();
    jump.rewind();
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