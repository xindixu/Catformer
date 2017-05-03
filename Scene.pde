abstract class Scene {
  String name;
  ArrayList<Platform> plf;
  ArrayList<Water> wtr;
  ArrayList<Coins> cn;
  ArrayList<Object> obj;
  ArrayList<Enemy> en;
  //ArrayList<Splash> s;
  String[] objName;
  int pfSize = 25;

  Scene(String name) {
    this.name = name;
    this.plf = new ArrayList();
    this.wtr = new ArrayList();
    this.cn = new ArrayList();
    this.obj = new ArrayList();
    this.en = new ArrayList();
    //this.s = new ArrayList();
  }

  abstract void generateObj();
  abstract void generatePlf();
  abstract void generateCn();
  abstract void generateEn();
}

class Forest extends Scene {
  Forest() {
    super("forest");
    String[] str = {"Bush (1)", "Bush (2)", "Bush (3)", "Bush (4)", "Crate", "Mushroom (1)", 
      "Mushroom (2)", "Sign (1)", "Sign (2)", "Stone", "Tree (1)", "Tree (2)", "Tree (3)"};
    this.objName = str.clone();
  }


  void generateObj() {
    obj.add(new Object(new PVector(410, 110), 5));
    obj.add(new Object(new PVector(680, 310), 6));
    obj.add(new Object(new PVector(770, 340), 0));
    obj.add(new Object(new PVector(860, 100), 9));
  }


  void generatePlf() {
    plf.add(new Platform_on_ground(new PVector(1350, 150), 5, 2));
    plf.add(new Platform_on_ground(new PVector(850, 150), 4, 1));

    plf.add(new Platform_on_ground(new PVector(400, 150), 6, 1));
    plf.add(new Platform_on_ground(new PVector(200, 400), 10, 1));
    
    plf.add(new Platform_on_ground(new PVector(650, 350), 3, 1));
    plf.add(new Platform_on_ground(new PVector(750, 400), 6, 1));
    
    plf.add(new Platform_on_ground(new PVector(800, 600), 4, 4));
    plf.add(new Platform_on_ground(new PVector(1075, 500), 10, 1));

    // ground
    plf.add(new Platform_on_ground(new PVector(0, 700), 27, 1));
    plf.add(new Platform_on_ground(new PVector(800, 700), 4, 1));

    wtr.add(new Water(new PVector(700, 700), 3, 1));
    wtr.add(new Water(new PVector(925, 700), 27, 1));
  }

  void generateCn() {
    for (int i = 0; i < 8; i++) {
      cn.add(new Coins(new PVector(150+50*i, 675), 15));
    }

    for (int i = 0; i < 3; i++) {
      cn.add(new Coins(new PVector(800+50*i, 575), 15));
      cn.add(new Coins(new PVector(300+50*i, 375), 15));
      cn.add(new Coins(new PVector(425+50*i, 125), 15));
      cn.add(new Coins(new PVector(1125+50*i, 475), 15));
    }
  }
  
  void generateEn(){
    en.add(new Enemy("zombie", new PVector(1350,450), a.pos));
    en.add(new Enemy("zombiegirl", new PVector(600,650), a.pos));
    
    for(Enemy e:en){
      e.setStates();
      e.update();
      e.display();
    }
  }
}

class Winter extends Scene {
  Winter() {
    super("winter");
    String[] str = {"Crate", "Crystal", "IceBox", "Igloo", "Sign (1)", "Sign (2)", 
      "SnowMan", "Stone", "Tree (1)", "Tree (2)"};
    this.objName = str.clone();
  }


  void generateObj() {
    obj.add(new Object(new PVector(350, 325), 1));
    obj.add(new Object(new PVector(770, 500), 3));
    obj.add(new Object(new PVector(505, 173), 7));
    obj.add(new Object(new PVector(1380, 325), 9));
  }

  void generatePlf() {
    plf.add(new Platform_on_ground(new PVector(100, 500), 2, 1));
    plf.add(new Platform_on_ground(new PVector(100, 250), 6, 1));

    plf.add(new Platform_on_ground(new PVector(300, 400), 5, 2));
    plf.add(new Platform_on_ground(new PVector(300, 150), 4, 1));

    plf.add(new Platform_on_ground(new PVector(500, 250), 4, 1));
    plf.add(new Platform_on_ground(new PVector(500, 550), 4, 1));
    plf.add(new Platform_on_ground(new PVector(600, 400), 3, 1));
    plf.add(new Platform_on_ground(new PVector(700, 450), 6, 1));
    plf.add(new Platform_on_ground(new PVector(675, 120), 7, 2));
    plf.add(new Platform_on_ground(new PVector(225, 900), 4, 1));
    plf.add(new Platform_on_ground(new PVector(950,480), 6, 1));
    plf.add(new Platform_on_ground(new PVector(1000, 145), 8, 1));
    plf.add(new Platform_on_ground(new PVector(1100, 350), 8, 2));  
    plf.add(new Platform_on_ground(new PVector(1400, 600), 7, 1));
    //flag platform
    plf.add(new Platform_on_ground(new PVector(1450, 150), 6, 1));

    // ground
    plf.add(new Platform_on_ground(new PVector(0, 700), 20, 1));
    plf.add(new Platform_on_ground(new PVector(575, 700), 3, 1));
    plf.add(new Platform_on_ground(new PVector(750, 700), 23, 1));

    wtr.add(new Water(new PVector(675, 700), 2, 1));
    wtr.add(new Water(new PVector(525, 700), 1, 1));
  }

  void generateCn() {
    for (int i = 0; i < 8; i++) {
      cn.add(new Coins(new PVector(150+50*i, 675), 15));
    }

    for (int i = 0; i < 3; i++) {
      cn.add(new Coins(new PVector(100+50*i, 225), 15));
      cn.add(new Coins(new PVector(100+50*i, 475), 15));
      cn.add(new Coins(new PVector(300+50*i, 125), 15));
      cn.add(new Coins(new PVector(500+50*i, 525), 15));
    }
  }
  
  void generateEn(){
    en.add(new Enemy("zombie", new PVector(1000,500), a.pos));
    en.add(new Enemy("zombiegirl", new PVector(500,500), a.pos));
    en.add(new Jack("jack", new PVector(1000,1000), a.pos));
    
    for(Enemy e:en){
      e.setStates();
      e.update();
      e.display();
    }
  }
}

class Desert extends Scene {
  Desert() {
    super("desert");
    String[] str = {"Bush (1)", "Bush (2)", "Cactus (1)", "Cactus (2)", "Cactus (3)", 
      "Crate", "Grass (1)", "Grass (2)", "Sign", "SignArrow", "Skeleton", 
      "Stone", "StoneBlock", "Tree"};
    this.objName = str.clone();
  }


  void generateObj() {
    obj.add(new Object(new PVector(100, 142), 2));
    obj.add(new Object(new PVector(690, 135), 3));
    obj.add(new Object(new PVector(500, 453), 4));
    obj.add(new Object(new PVector(1460, 499), 5));
    obj.add(new Object(new PVector(1495, 553), 7));    
    obj.add(new Object(new PVector(950, 652), 10));
    
  }


  void generatePlf() {
    plf.add(new Platform_on_ground(new PVector(100, 500), 2, 1));
    plf.add(new Platform_on_ground(new PVector(100, 250), 6, 1));

    plf.add(new Platform_on_ground(new PVector(300, 400), 5, 2));
    plf.add(new Platform_on_ground(new PVector(300, 150), 4, 1));

    plf.add(new Platform_on_ground(new PVector(500, 250), 4, 1));
    plf.add(new Platform_on_ground(new PVector(500, 550), 4, 1));
    plf.add(new Platform_on_ground(new PVector(600, 400), 3, 1));
    plf.add(new Platform_on_ground(new PVector(700, 450), 6, 1));
    plf.add(new Platform_on_ground(new PVector(650, 180), 10, 1));
    plf.add(new Platform_on_ground(new PVector(270, 1000), 6, 2));
    plf.add(new Platform_on_ground(new PVector(1150, 350), 7, 1));  
    plf.add(new Platform_on_ground(new PVector(1450, 600), 5, 1));
    //flag platform
    plf.add(new Platform_on_ground(new PVector(1370, 150), 4, 1));


    // ground
    plf.add(new Platform_on_ground(new PVector(0, 700), 20, 1));
    plf.add(new Platform_on_ground(new PVector(575, 700), 3, 1));
    plf.add(new Platform_on_ground(new PVector(750, 700), 20, 1));

    wtr.add(new Water(new PVector(675, 700), 2, 1));
    wtr.add(new Water(new PVector(525, 700), 1, 1));
  }

  void generateCn() {
    for (int i = 0; i < 8; i++) {
      cn.add(new Coins(new PVector(150+50*i, 675), 15));
    }

    for (int i = 0; i < 3; i++) {
      cn.add(new Coins(new PVector(100+50*i, 225), 15));
      cn.add(new Coins(new PVector(100+50*i, 475), 15));
      cn.add(new Coins(new PVector(300+50*i, 125), 15));
      cn.add(new Coins(new PVector(500+50*i, 525), 15));
    }
  }
  
  void generateEn(){
    en.add(new Enemy("zombie", new PVector(1500,500), a.pos));
    en.add(new Enemy("zombiegirl", new PVector(200,500), a.pos));
    en.add(new Enemy("jack", new PVector(60,1000), a.pos));
    
    for(Enemy e:en){
      e.setStates();
      e.update();
      e.display();
    }
  }
}

class Graveyard extends Scene {
  Graveyard() {
    super("graveyard");
    String[] str = {"ArrowSign", "Bush (1)", "Bush (2)", "Crate", "DeadBush", "Sign", 
      "Skeleton", "TombStone (1)", "TombStone (2)", "Tree"};
    this.objName = str.clone();
  }


  void generateObj() {
    obj.add(new Object(new PVector(100, 415), 1));
    obj.add(new Object(new PVector(950, 80), 4));
    obj.add(new Object(new PVector(1400, 445), 7));
    obj.add(new Object(new PVector(630, 625), 8));
    obj.add(new Object(new PVector(815, 460), 9));

    
  }

  void generatePlf() {
    plf.add(new Platform_on_ground(new PVector(200, 500), 2, 1));
    plf.add(new Platform_on_ground(new PVector(450, 300), 4, 1)); 
      
    plf.add(new Platform_on_ground(new PVector(100, 500), 8, 1));
    plf.add(new Platform_on_ground(new PVector(1300, 500), 7, 1));
    plf.add(new Platform_on_ground(new PVector(900, 400), 5, 1));
    plf.add(new Platform_on_ground(new PVector(950, 150), 6, 1));
    plf.add(new Platform_on_ground(new PVector(80, 100), 4, 1));
    
    plf.add(new Platform_on_ground(new PVector(180, 140), 9, 1));
    plf.add(new Platform_on_ground(new PVector(1435, 150), 4, 2));
    plf.add(new Platform_on_ground(new PVector(650, 480), 6, 1));
    

    // ground
    plf.add(new Platform_on_ground(new PVector(0, 700), 15, 1));
    plf.add(new Platform_on_ground(new PVector(575, 700), 6, 1));
    plf.add(new Platform_on_ground(new PVector(875, 700), 24, 1));

    wtr.add(new Water(new PVector(375, 700), 8, 1));
    wtr.add(new Water(new PVector(725, 700), 6, 1));
    wtr.add(new Water(new PVector(1475, 700), 6, 1));
    
    wtr.add(new Water(new PVector(1400, 500), 1, 1));
    wtr.add(new Water(new PVector(1200, 200), 4, 1));
    
  }

  void generateCn() {
    for (int i = 0; i < 8; i++) {
      cn.add(new Coins(new PVector(150+50*i, 675), 15));
    }

    for (int i = 0; i < 3; i++) {
      cn.add(new Coins(new PVector(100+50*i, 225), 15));
      cn.add(new Coins(new PVector(100+50*i, 475), 15));
      cn.add(new Coins(new PVector(300+50*i, 125), 15));
      cn.add(new Coins(new PVector(500+50*i, 525), 15));
    }
  }
  
  void generateEn(){
    en.add(new Enemy("zombie", new PVector(200,100), a.pos));
    en.add(new Enemy("zombiegirl", new PVector(500,300), a.pos));
    
    en.add(new Enemy("zombiegirl", new PVector(1100,200), a.pos));
    en.add(new Jack("jack", new PVector(300,500), a.pos));
    
    en.add(new Enemy("zombie", new PVector(1200,400), a.pos));
    
    for(Enemy e:en){
      e.setStates();
      e.update();
      e.display();
    }
  }
}

void setupScene() {
  Forest f = new Forest();
  Winter w = new Winter();  
  Desert d = new Desert();
  Graveyard g = new Graveyard();

  en.scene.put(f.name, f);
  en.scene.put(w.name, w);
  en.scene.put(d.name, d);
  en.scene.put(g.name, g);

  for (Scene sc : en.scene.values()) {
    sc.generatePlf();
    sc.generateCn();
    sc.generateEn();
    sc.generateObj();
  }
}