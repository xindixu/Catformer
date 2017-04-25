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
    
  }
  
  void update(String n, int s){
    scoresList = file.getChildren("main/scores");
    for(int x = 4; x >= 0; x--){
      if((scoresList[x].getChild("points").getIntContent()) <= s){
        continue;
      }else{
          if(x == 4){
            break; 
          }
          else if((scoresList[x+1].getChild("points").getIntContent()) > s){
            scoresList[x+1].getChild("name").setContent(n);
            scoresList[x+1].getChild("points").setContent(str(s));
          }
        
      }
    }
    
  }
  
  void display(){
    font = createFont("Comic Sans MS Bold", 25);
    title = file.getChild("main/title").getContent();
    scoresList = file.getChildren("main/scores");
    
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