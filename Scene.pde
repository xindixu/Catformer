abstract class Scene{
  String name;
  ArrayList<Platform> plf;
  ArrayList<Water> wtr;
  ArrayList<Coins> cn;
  ArrayList<Object> obj;
  ArrayList<PImage> img;
  int pfSize = 25;
  
  Scene(String name){
    this.name = name;
    this.plf = new ArrayList();
    this.wtr = new ArrayList();
    this.cn = new ArrayList();
    this.img = new ArrayList();
  }
  
  abstract void loadImgObj();
  abstract void generatePlf();
  abstract void generateCn();
  
}

class Forest extends Scene{
  Forest(){
    super("forest");
  }
  
  void loadImgObj(){
    String[] str = {"Bush (1)","Bush (2)","Bush (3)","Bush (4)","Crate","Mushroom (1)",
                    "Mushroom (2)","Sign (1)","Sign (2)","Stone","Tree (1)","Tree (2)","Tree (3)"};
    for(String s:str){
      img.add(loadImage("scene/forest/Objects/"+s));
    }
  }
  
  void generateObj(){
    obj.add()
  }
  
  void generatePlf(){
    plf.add(new Platform_on_ground(new PVector(100, 500), 2, 1));
    plf.add(new Platform_on_ground(new PVector(100, 250), 6, 1));
    
    plf.add(new Platform_on_ground(new PVector(300, 400), 5, 2));
    plf.add(new Platform_on_ground(new PVector(300, 150), 4, 1));
    
    plf.add(new Platform_on_ground(new PVector(500, 250), 4, 1));
    plf.add(new Platform_on_ground(new PVector(500, 550), 4, 1));
    plf.add(new Platform_on_ground(new PVector(600, 400), 3, 1));
    plf.add(new Platform_on_ground(new PVector(700, 450), 6, 1));
    
    // ground
    plf.add(new Platform_on_ground(new PVector(0, 700), 20, 1));
    plf.add(new Platform_on_ground(new PVector(575,700), 3, 1));
    plf.add(new Platform_on_ground(new PVector(750,700), 50, 1));
    
    wtr.add(new Water(new PVector(675,700),2,1));
    wtr.add(new Water(new PVector(525,700),1,1));
  }
  
  void generateCn(){
    for(int i = 0; i < 8; i++){
      cn.add(new Coins(new PVector(150+50*i,675), 15));
    }
    
    for(int i = 0; i < 3; i++){
      cn.add(new Coins(new PVector(100+50*i,225), 15));
      cn.add(new Coins(new PVector(100+50*i,475), 15));
      cn.add(new Coins(new PVector(300+50*i,125), 15));
      cn.add(new Coins(new PVector(500+50*i,525), 15));
    }
  }
}

class Winter extends Scene{
  Winter(){
    super("winter");
  }
  
  void loadImgObj(){
    String[] str = {"Crate","Crystal","IceBox","Igloo","Sign (1)","Sign (2)",
                    "SnowMan","Stone","Tree (1)","Tree (2)"};
    for(String s:str){
      img.add(loadImage("scene/winter/Objects/"+s));
    }
  }
  
  void generatePlf(){
    plf.add(new Platform_on_ground(new PVector(100, 500), 2, 1));
    plf.add(new Platform_on_ground(new PVector(100, 250), 6, 1));
    
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
  
  void generateCn(){
    for(int i = 0; i < 8; i++){
      cn.add(new Coins(new PVector(150+50*i,675), 15));
    }
    
    for(int i = 0; i < 3; i++){
      cn.add(new Coins(new PVector(100+50*i,225), 15));
      cn.add(new Coins(new PVector(100+50*i,475), 15));
      cn.add(new Coins(new PVector(300+50*i,125), 15));
      cn.add(new Coins(new PVector(500+50*i,525), 15));
    }
  }
}

class Desert extends Scene{
  Desert(){
    super("desert");
  }
  
  void loadImgObj(){
    String[] str = {"Bush (1)","Bush (2)","Cactus (1)","Cactus (2)","Cactus (3)",
                    "Crate","Grass (1)","Grass (2)","Sign","SignArrow","Skeleton",
                    "Stone","StoneBlock","Tree"};
    for(String s:str){
      img.add(loadImage("scene/desert/Objects/"+s));
    }
  }
  
  void generatePlf(){
    plf.add(new Platform_on_ground(new PVector(100, 500), 2, 1));
    plf.add(new Platform_on_ground(new PVector(100, 250), 6, 1));
    
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
  
  void generateCn(){
    for(int i = 0; i < 8; i++){
      cn.add(new Coins(new PVector(150+50*i,675), 15));
    }
    
    for(int i = 0; i < 3; i++){
      cn.add(new Coins(new PVector(100+50*i,225), 15));
      cn.add(new Coins(new PVector(100+50*i,475), 15));
      cn.add(new Coins(new PVector(300+50*i,125), 15));
      cn.add(new Coins(new PVector(500+50*i,525), 15));
    }
  }
}

class Graveyard extends Scene{
  Graveyard(){
    super("graveyard");
  }
  
  void loadImgObj(){
    String[] str = {"ArrowSign","Bush (1)","Bush (2)","Crate","DeathBush","Sign","Skelton",
                    "Skeleton","TombStone (1)","TombStone (2)","Tree"};
    for(String s:str){
      img.add(loadImage("scene/graveyard/Objects/"+s));
    }
  }
  
  void generatePlf(){
    plf.add(new Platform_on_ground(new PVector(100, 500), 2, 1));
    plf.add(new Platform_on_ground(new PVector(100, 250), 6, 1));
    
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
  
  void generateCn(){
    for(int i = 0; i < 8; i++){
      cn.add(new Coins(new PVector(150+50*i,675), 15));
    }
    
    for(int i = 0; i < 3; i++){
      cn.add(new Coins(new PVector(100+50*i,225), 15));
      cn.add(new Coins(new PVector(100+50*i,475), 15));
      cn.add(new Coins(new PVector(300+50*i,125), 15));
      cn.add(new Coins(new PVector(500+50*i,525), 15));
    }
  }
}

void setupScene(){
  Forest f = new Forest();
  Winter w = new Winter();  
  Desert d = new Desert();
  Graveyard g = new Graveyard();
  
  en.scene.put(f.name,f);
  en.scene.put(w.name,w);
  en.scene.put(d.name,d);
  en.scene.put(g.name,g);
  
  for(Scene sc:en.scene.values()){
    sc.generatePlf();
    sc.generateCn();
  }
}