class Platform_on_ground extends Platform{
    
  Platform_on_ground( PVector pos, int wn, int hn){
    super(pos,wn,hn,"on_ground");
  }
  
  
  // overide
  void display(){
    image(plfImg[0],pos.x,pos.y);
    image(plfImg[2],pos.x+size*wn,pos.y);
    image(plfImg[11],pos.x,pos.y+size*hn);
    image(plfImg[15],pos.x+size*wn,pos.y+size*hn);
    
    for(int i = 1; i < wn; i++){
      // surface middle
      image(plfImg[1],pos.x+i*size,pos.y);
      // bottom middle 
      image(plfImg[8],pos.x+i*size,pos.y+size*hn);
    }
    
    for(int j = 1; j < hn; j++){
      // edge left  
      image(plfImg[3],pos.x,pos.y+j*size);
      // edge right
      image(plfImg[5],pos.x+size*wn,pos.y+j*size);
    }
    
    for(int m = 1; m < wn; m++){
      for(int n = 1; n < hn; n++){
        // middle
        image(plfImg[4],pos.x+m*size,pos.y+n*size);
      }
    }
  }
}