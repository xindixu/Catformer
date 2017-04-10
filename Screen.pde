class Screen{
  
  ArrayList<String> text;
  ArrayList<PVector> pos;
  ArrayList<Integer> txc;
  ArrayList<PFont> txf;
  //ArrayList<GUI> gui;
  PImage bg;
  PVector[] buttonPos;
  
  Screen(){
    this.text = new ArrayList();
    this.pos = new ArrayList();
    this.txc = new ArrayList();
    this.txf = new ArrayList();
    buttonPos = new PVector[4];
  }
  
  void construct(String[] text, PVector[] pos, color[] txc, PFont[] txf, PImage bg, PVector[] bPos){
    for(int i = 0; i < pos.length; i ++){
      addText(text[i],pos[i],txc[i],txf[i]);
    }
    this.bg = bg;
    this.buttonPos = bPos.clone();
  }
  
  
  void addText(String text, PVector pos, color txc, PFont txf){
    this.text.add(text);
    this.pos.add(pos);
    this.txc.add(txc);
    this.txf.add(txf);
  }
  
  void updateText(int i, String text){
    this.text.set(i,text);
  }
  
  
  void display(){
    image(bg,0,0);
    for(int i = 0; i < pos.size(); i ++){
      fill(txc.get(i));
      textFont(txf.get(i));
      text(text.get(i),pos.get(i).x,pos.get(i).y);
    }
    
  }
}