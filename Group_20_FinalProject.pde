import ddf.minim.*;
//songs from http://ericskiff.com/music/
//jump sfx from https://opengameart.org/content/8-bit-jump-1
import java.util.Map;

Minim minim;
AudioPlayer player;
AudioPlayer jump;

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
  
  minim = new Minim(this);
  jump = minim.loadFile("sounds/Jump.wav");
  player = minim.loadFile("sounds/Underclocked(level1).mp3");
  player.play();
  player.loop();
  
  
  en = new Enivornment();
  en.setupEnv();   
  
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
    //zb.update();
    //zb.display();
    zg.update();
    zg.display();
    if(en.flag.detectFlag()){
      a.reset();
      //zb.reset();
      zg.reset();
      switch(en.currentScene){
        case "forest":
          en.setScene("winter");
          player.close();
          player = minim.loadFile("sounds/Come and Find Me(level2).mp3");
          player.play();
          player.loop();
          break;
        case "winter":
          en.setScene("desert");
          player.close();
          player = minim.loadFile("sounds/Searching(level3).mp3");
          player.play();
          player.loop();
          break;
        case "desert":
          en.setScene("graveyard");
          player.close();
          player = minim.loadFile("sounds/DigitalNative(level4).mp3");
          player.play();
          player.loop();
          break;
        case "graveyard":
          en.setScreen("Win");
          player.close();
          break;
      }
    }
  }
  
  else if(en.currentScreen == "Win"){
      player.close();
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
    player.close();
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
    if (jump.isPlaying()){
      jump.pause();
    } else if (jump.position() == jump.length()){
        jump.rewind();
        jump.play();
    } else{
        jump.play();
    }
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
  
  if(key == 'm' || key == 'M'){
    if (player.isPlaying()){
      player.pause();
    } else if (player.position() == player.length()){
        player.rewind();
        player.play();
    } else{
        player.play();
    }
  }
  
}