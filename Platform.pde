abstract class Platform{
  Enivornment en;
  int size = 25;
  PVector pos;
  int wn,hn;
  int w,h;
  String property;
  // l,r,t,b 
  // x,x,y,y
  float[] b;
  
  Platform(){}
  Platform(PVector pos, int wn, int hn, String property){
    this.pos = pos.copy();
    this.wn = wn;
    this.hn = hn;
    this.w = (wn+1)*size;
    this.h = (hn+1)*size;
    this.property = property;
    this.b = new float[4];
  }
  
  void generateBoundaries(){
    b[0] = pos.x;
    b[1] = pos.x+w;
    b[2] = pos.y;
    b[3] = pos.y+h;
    //displayBoundaries();
  }
  
  void displayBoundaries(){
    line(b[0],b[2],b[0],b[3]); 
    line(b[0],b[2],b[1],b[2]);
    line(b[1],b[3],b[1],b[2]);
    line(b[1],b[3],b[0],b[3]);  
  }
  abstract void display();
}