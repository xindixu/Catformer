class GUI {
  ArrayList<Button> bt;
  ArrayList<Box> bx;
  PImage wood;
  GUI() {
    this.bt = new ArrayList();
    this.bx = new ArrayList();
    wood = loadImage("GUI/wood.png");
    wood.resize(250,120);
  }

  void setupGUI() {
    s = new Score(0);
    t = new Timer();
    generateButtons();
    generateBoxes();
  }

  void display() {
    image(wood,0,0);
    t.display();
    s.display();
    text("Life: ",30,60);
     // display lives
    for (int i = 0; i < a.lives; i ++) {
      image(heart, 80+20*i, 50);
    }
    displayBttn(); 
    displayBox();
  }


  void generateBoxes() {
    String s = "How to play: xxxxxxxxxxxxxxxxxxxxxxx";
    Box info = new Box("Box", 700, 500, s, new PVector(width/2-350, height/2-250));
    en.box.put("Info", info);
    
    //Box menu = new Box("Box", 700, 500, s, new PVector(width/2-350, height/2-250));
    //en.box.put("Menu", menu);
    
    //menu.setButtons();
    
  }

  void generateButtons() {
    for (int i = 0; i < en.buttonName.length; i ++) {
      String n = en.buttonName[i];
      Button b = new Button(n);
      for (int j = 0; j < 3; j++) {
        b.loadImg(n+" (", ").png");
      }
      en.button.put(n, b);
    }
  }


  void detectBttn() {
    for (int i = 0; i < en.buttonName.length; i ++) {
      String n = en.buttonName[i];
      Button b = en.button.get(n);
      b.detect();
    }
  }

  void bttnAct() {
    Button pause = en.button.get("Pause");
    if (pause.status == "Clicked") {
      en.setScreen("Pause");
    }

    Button quit = en.button.get("Quit");
    if (quit.status == "Clicked") {
      exit();
    }

    Button resume = en.button.get("Resume");
    if (resume.status == "Clicked") {
      en.setScreen("Game");
    }

    Button restart = en.button.get("Restart");
    if (restart.status == "Clicked") {
      en.setScreen("Game");
      en.setScene("forest");
      a.reset();
      en.resetCoins();
      s.resetScore();
      t.resetTime();
      a.lives = 3;
    }

    Button info = en.button.get("Info");
    if (info.status == "Clicked") {
      en.setScreen("Home");
      Box infob = en.box.get("Info");
      infob.on = true;
    }

    Button home = en.button.get("Home");
    if (home.status == "Clicked") {
      en.setScreen("Home");
    }

    Button start = en.button.get("Start");
    if (start.status == "Clicked") {
      en.setScreen("Game");
    }
    
    Button music = en.button.get("Music");
    if (music.status == "Clicked" && en.player.isPlaying()) {
      en.player.pause();
      music.status = "Normal";
    }
    if (music.status == "Clicked" && !en.player.isPlaying()) {
      en.player.play();
      music.status = "Normal";
    }
    
    
    
  }



  // button 
  void displayBttn() {
    for (int i = 0; i < en.buttonName.length; i ++) {
      String n = en.buttonName[i];
      Button b = en.button.get(n);
      b.display();
    }
  }

  void displayBox() {
    Box b = en.box.get("Info");
    b.display();
  }
}