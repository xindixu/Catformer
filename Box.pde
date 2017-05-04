class Box {
  PImage img;
  PVector pos;
  String name;
  int w, h;
  String info;
  boolean on;
  Button close;
  String body;
  Boolean isHighScore;


  Box(String name, int w, int h, String info, String body, PVector pos, Boolean isHighScore) {
    this.name = name;
    this.w = w;
    this.h = h;
    this.pos = pos.copy();
    this.isHighScore = isHighScore;
    img = loadImage("GUI/box/"+name+".png");
    img.resize(w, h);
    this.info = info;this.body = body;
    this.on = false;
    close = new Button("Close");
    close.loadImg("Close"+" (", ").png");
    close.update(new PVector(1100, 200));
  }

  void close() {
    if (close.status == "Clicked") {
      on = false;
    }
  }
  
  void setButtons(){
    //int i = 0;
    //for(String str: bttn){
    //  gui.bt.get
    //  b.update(pos[i]);
    //  i++;
    //}
  }


  void display() {
    if (on) {
      pushMatrix();
      translate(pos.x, pos.y);
      image(img, 0, 0);
      textSize(40);
      text(info,225,37);
      textSize(12);
      text(body,40,100, w-80, h-100);
      if(isHighScore){
        highscore.display();
      }
      popMatrix();
      close.display();
      close.detect();
      //for(Button b: bttn){
      //  b.display();
      //}
    }
    if (close.status == "Clicked") {
      on = false;
      text = "";
      en.setScreen(en.currentScreen);
    }
  }
}

class Textbox extends Box {
  int tw, th;
  
  Textbox(String name, int w, int h, String info, String body, PVector pos, Boolean isHighScore, int tw, int th) {
    super(name, w, h, info,body, pos, isHighScore);
    this.tw = tw;
    this.th = th;
  }

   void read(){
    
  }

  void display() {
    if (on) {
      super.display();
      fill(0);
      textSize(40);
      text(text,pos.x+300,pos.y+300);
    }
  }
}