//songs from http://ericskiff.com/music/
//victory and coin sound from https://opengameart.org/content/8-bit-sound-effects-library
//jump sfx from https://opengameart.org/content/8-bit-jump-1
import ddf.minim.*;
import java.util.Map;

Minim minim;
AudioPlayer jumpsound;

Sprite a;
Splash ws;

XML xml;
HighScore highscore;

static Score s;
static Timer t;
static GUI gui;
static PImage bg, heart;
static PImage[] plfImg, btnImg;
static boolean left, right, up, down, mouse,newInput;
static String text;

Enivornment en;

void setup() {
  size(1600, 750);
  frameRate(60);

  minim = new Minim(this);

  jumpsound = minim.loadFile("sounds/Jump.wav");
  
  
  
  xml = loadXML("score/highscores.xml");
  highscore = new HighScore(xml);
  
  en = new Enivornment();
  gui = new GUI();
  gui.setupGUI();
  en.setupEnv();   
  

  en.music();
  text = "";
  left = false; right = false; up = false; down = false; newInput = false;
}

void draw() {
  en.display();
  ws = new Splash(10, a.pos);
  
  gui.detectBttn();
  gui.bttnAct();
  gui.display();

  if (a.lives > 0 && en.currentScreen == "Game") {
    if (a.currentState == "Dead") {
      en.resetCoins();
    }
    t.update();
    t.display();
    a.update();
    a.display();
    if(en.flag.detectFlag()){
      a.reset();
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
  } else if (en.currentScreen == "Info") {
    // pause and display info
    en.getScreen("Info");
  } else if (en.currentScreen == "Home") {
    en.getScreen("Home");
  } 
  else{
    en.setScreen("Lose");
    en.getScreen("Lose").updateText(2, str(s.score+5*a.lives+10-int(t.frameCnt/240)));
  }
}


void mousePressed() {
  mouse = true;
}
void mouseReleased() {
  mouse = false;
}

void keyPressed() {
  switch (keyCode) {
  case 37://left
    left = true;
    break;
  case 39://right
    right = true;
    break;
  case 38: //up
    up = true;
    ws.run();
    jumpsound.play();
    jumpsound.rewind();
    break;
  case 40://down
    down = true;
    break;
  }
  
  if(key == BACKSPACE){
    if(text.length()>0){
      text = text.substring(0,text.length()-1);
    }
  }
  else if(key == RETURN || key == ENTER){
    text = "";
  }
  else{
    if(text.length() < 3){
      text += key;
    }
  }
}


void keyReleased() {
  switch (keyCode) {
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