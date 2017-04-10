class Score{
  int score;
  
  //constructor
  Score(int _score){
    this.score = _score;
  }
  
  //increments the score when called on
  void incrementScore(){
    score ++;
  }
  
  //sets score to 0 when called on
  void resetScore(){
    score = 0;
  }

  
  //displays score
  void display(){
    strokeWeight(4);
    fill(0);
    text(score, 80, 20);
  }
}