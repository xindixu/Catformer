class Platform_on_ground extends Platform{
    
  Platform_on_ground( PVector pos, int wn, int hn){
    super(pos,wn,hn,"on_ground");
  }
 
  void display(){
    image(en.plfImg[0],pos.x,pos.y);
    image(en.plfImg[2],pos.x+size*wn,pos.y);
    image(en.plfImg[11],pos.x,pos.y+size*hn);
    image(en.plfImg[12],pos.x+size*wn,pos.y+size*hn);
    
    for(int i = 1; i < wn; i++){
      // surface middle
      image(en.plfImg[1],pos.x+i*size,pos.y);
      // bottom middle 
      image(en.plfImg[8],pos.x+i*size,pos.y+size*hn);
    }
    
    for(int j = 1; j < hn; j++){
      // edge left  
      image(en.plfImg[3],pos.x,pos.y+j*size);
      // edge right
      image(en.plfImg[5],pos.x+size*wn,pos.y+j*size);
    }
    
    for(int m = 1; m < wn; m++){
      for(int n = 1; n < hn; n++){
        // middle
        image(en.plfImg[4],pos.x+m*size,pos.y+n*size);
      }
    }
  }
}