class Button{
  // normal hover clicked
  PImage[] img;
  String name;
  PVector pos;
  int size;
  String status;
  
  Button(String name){
    status = "Normal";
    this.img = new PImage[3];
    this.name = name;
  }
 
  
  void loadImg(String file1,String file2){
    for(int i = 0; i < 3; i++){
      img[i] = loadImage("Button/"+file1+(i+1)+file2);
      img[i].resize(50,50);
    }
  }
  
  void display(){
    imageMode(CENTER);
    if(status == "Normal"){
      image(img[0],pos.x,pos.y);
    }  
    if(status == "Hover"){
      image(img[1],pos.x,pos.y);
      textSize(11);
      text(name,pos.x+15,pos.y-10);
    }  
    if(status == "Clicked"){
      image(img[2],pos.x,pos.y);
    }  
    //ellipse(pos.x,pos.y,5,5);
    
    imageMode(CORNER);
  }
 
  void update(PVector pos,int size){
    this.pos = pos;
    this.size = size;
  }
  
  void detect(){
    if(abs(mouseX-pos.x) < 25 && abs(mouseY-pos.y) < 25){
      status = "Hover";
      if(mouse){
        status = "Clicked";
      }
    }
    else{
      status = "Normal";
    }
  }
}