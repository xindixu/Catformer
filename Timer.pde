class Timer{
  int init,frameCnt,interval;
  
  Timer(){
    this.init = millis();
    this.interval = 1000/24; // 1000 ms = 1 s
    this.frameCnt = 0;
  }

  void update(){
    if(millis()-init > interval){
      init = millis();
      frameCnt += 1;
    }
  }
  
  void resetTime(){
    this.frameCnt = 0;
  }
  
  void display(){
    strokeWeight(4);
    fill(0);
    textSize(20);
    text("Frame: " + frameCnt,10,80);
    text("Time: " + frameCnt/24,10,100);
  }
}