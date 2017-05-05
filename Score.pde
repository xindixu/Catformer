class Score {
  int score, add;

  //constructor
  Score(int _score) {
    this.score = _score;
  }

  //increments the score when called on
  void incrementScore() {
    score ++;
  }
  void add(int add) {
    score += add;
  }

  //sets score to 0 when called on
  void resetScore() {
    score = 0;
  }
  
  void setScore(int i){
    this.score = i;
  }

  //displays score
  void display() {
    strokeWeight(4);
    fill(0);
    textSize(20);
    text("Score: "+score, 30, 40);
  }
}