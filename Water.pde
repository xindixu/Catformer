class Water extends Platform {
  
   Water(PVector pos, int wn, int hn){
    super(pos,wn,hn,"water");
  }
  
  //override
  void display(){
    for(int i = 0; i < wn+1; i++){
      image(plfImg[16],pos.x+i*size,pos.y);
      for(int j = 1; j< hn+1; j++){  
        image(plfImg[17],pos.x+i*size,pos.y+j*size);
      }
    }    
  }

}