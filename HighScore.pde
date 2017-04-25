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
    for(int x = 4; x >= -1; x--){
      if((scoresList[x].getChild("points").getIntContent()) <= s){
        continue;
      }else{
          //less than fifth top score
          if(x == 4){
            break; 
            
            //less than fourth top score
          } else if(x == 3){
              scoresList[4].getChild("name").setContent(n);
              scoresList[4].getChild("points").setContent(str(s));
              
            //less than third top score
          } else if(x == 2){
              scoresList[4].getChild("name").setContent(scoresList[3].getChild("name").getContent());
              scoresList[3].getChild("name").setContent(n);

              scoresList[4].getChild("points").setContent(scoresList[3].getChild("points").getContent());
              scoresList[3].getChild("points").setContent(str(s));
              
            //less than second top score
          } else if(x == 1){
              scoresList[4].getChild("name").setContent(scoresList[3].getChild("name").getContent());
              scoresList[3].getChild("name").setContent(scoresList[2].getChild("name").getContent());
              scoresList[2].getChild("name").setContent(n);
              
              scoresList[4].getChild("points").setContent(scoresList[3].getChild("points").getContent());
              scoresList[3].getChild("points").setContent(scoresList[2].getChild("points").getContent());
              scoresList[2].getChild("points").setContent(str(s));
              
            //less than first top score
          } else if(x == 0){
              scoresList[4].getChild("name").setContent(scoresList[3].getChild("name").getContent());
              scoresList[3].getChild("name").setContent(scoresList[2].getChild("name").getContent());
              scoresList[2].getChild("name").setContent(scoresList[1].getChild("name").getContent());
              scoresList[1].getChild("name").setContent(n);
              
              scoresList[4].getChild("points").setContent(scoresList[3].getChild("points").getContent());
              scoresList[3].getChild("points").setContent(scoresList[2].getChild("points").getContent());
              scoresList[2].getChild("points").setContent(scoresList[1].getChild("points").getContent());
              scoresList[1].getChild("points").setContent(str(s));

            //new top score
          } else{
              scoresList[4].getChild("name").setContent(scoresList[3].getChild("name").getContent());
              scoresList[3].getChild("name").setContent(scoresList[2].getChild("name").getContent());
              scoresList[2].getChild("name").setContent(scoresList[1].getChild("name").getContent());
              scoresList[1].getChild("name").setContent(scoresList[0].getChild("name").getContent());
              scoresList[0].getChild("name").setContent(n);
              
              scoresList[4].getChild("points").setContent(scoresList[3].getChild("points").getContent());
              scoresList[3].getChild("points").setContent(scoresList[2].getChild("points").getContent());
              scoresList[2].getChild("points").setContent(scoresList[1].getChild("points").getContent());
              scoresList[1].getChild("points").setContent(scoresList[0].getChild("points").getContent());
              scoresList[0].getChild("points").setContent(str(s));
              
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