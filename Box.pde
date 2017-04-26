class Box {
  PImage img;
  PVector pos;
  String name;
  int w, h;
  String info;
  boolean on;
  Button close;

  Box(String name, int w, int h, String info, PVector pos) {
    this.name = name;
    this.w = w;
    this.h = h;
    this.pos = pos.copy();
    img = loadImage("GUI/box/"+name+".png");
    img.resize(w, h);
    this.info = info;
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



  void display() {
    if (on) {
      pushMatrix();
      translate(pos.x, pos.y);
      image(img, 0, 0);
      text(info, pos.x, pos.y, w, h);
      popMatrix();
      close.display();
      close.detect();
    }
    if (close.status == "Clicked") {
      on = false;
      en.setScreen("Game");
    }
  }
}

class Textbox extends Box {
  int tw, th;
  Textbox(String name, int w, int h, String info, PVector pos, int tw, int th) {
    super(name, w, h, info, pos);
    this.tw = tw;
    this.th = th;
  }

  void input() {
    // user input 
    // name initials
  }

  void display() {
    super.display();
  }
}