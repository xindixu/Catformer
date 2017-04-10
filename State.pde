class State{
  int frameCnt;
  String name;
  boolean end;
  PImage[] img;
    
  State(int frameCnt,String name){
    this.frameCnt = frameCnt;
    this.img = new PImage[frameCnt];  
    this.name = name;
    this.end = false;
  }
  
  void loadImg(String file1,String file2, int size){
    for(int i = 0; i < frameCnt; i++){
      img[i] = loadImage(file1+(i+1)+file2);
      img[i].resize(size,size); 
    }
  }
  
  void display(boolean flip){
    int index = t.frameCnt % frameCnt;
    if(!flip){
      image(img[index],0,0);
    }
    else{
      image(img[index],-img[index].width,0);
    }
    if(index == frameCnt-1){
      this.end = true;
    }
  }
}