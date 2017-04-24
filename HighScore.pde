class HighScore{
  PFont font;
  XML file;
  String title;
  String name;
  String score;
  int y;
  XML[] scoresList;
  
  HighScore(XML input){
    this.file = input;
    title = file.getChild("main/title").getContent();
    scoresList = file.getChildren("main/scores");
    
  }
  
  void display(){
    font = createFont("Comic Sans MS Bold", 25);
    
    y = 100;
    textFont(font);
    text(title, 100, 40);
    
    for(int i = 0; i < scoresList.length; i++){
      name = scoresList[i].getChild("name").getContent();
      score = scoresList[i].getChild("points").getContent();
      
      text(name, 100, y);
      text(score, 200, y);
      
      y += 60;
    }
    
  }
  
  
}