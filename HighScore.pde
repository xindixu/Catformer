class HighScore{
  PFont font;
  XML file;
  String title;
  String name;
  String score;
  int y;
  XML[] namesList;
  XML[] pointsList;
  HashMap<String,Integer> scores = new HashMap<String,Integer>();
  
  HighScore(XML input){
    this.file = input;
    
  }
  
  void update(String n, int s){
    namesList = file.getChildren("scores/entry/name");
    pointsList = file.getChildren("scores/entry/points");
    for(int x = 4; x >= -1; x--){
      if((pointsList[x].getIntContent()) <= s){
        continue;
      }else{
          //less than fifth top score
          if(x == 4){
            break; 
            
            //less than fourth top score
          } else if(x == 3){
              namesList[4].setContent(n);
              pointsList[4].setContent(str(s));
              
            //less than third top score
          } else if(x == 2){
              namesList[4].setContent(namesList[3].getContent());
              namesList[3].setContent(n);

              pointsList[4].setContent(pointsList[3].getContent());
              pointsList[3].setContent(str(s));
              
            //less than second top score
          } else if(x == 1){
              namesList[4].setContent(namesList[3].getContent());
              namesList[3].setContent(namesList[2].getContent());
              namesList[2].setContent(n);
              
              pointsList[4].setContent(pointsList[3].getContent());
              pointsList[3].setContent(pointsList[2].getContent());
              pointsList[2].setContent(str(s));
              
            //less than first top score
          } else if(x == 0){
              namesList[4].setContent(namesList[3].getContent());
              namesList[3].setContent(namesList[2].getContent());
              namesList[2].setContent(namesList[1].getContent());
              namesList[1].setContent(n);
              
              pointsList[4].setContent(pointsList[3].getContent());
              pointsList[3].setContent(pointsList[2].getContent());
              pointsList[2].setContent(pointsList[1].getContent());
              pointsList[1].setContent(str(s));

            //new top score
          } else{
              namesList[4].setContent(namesList[3].getContent());
              namesList[3].setContent(namesList[2].getContent());
              namesList[2].setContent(namesList[1].getContent());
              namesList[1].setContent(namesList[0].getContent());
              namesList[0].setContent(n);
              
              pointsList[4].setContent(pointsList[3].getContent());
              pointsList[3].setContent(pointsList[2].getContent());
              pointsList[2].setContent(pointsList[1].getContent());
              pointsList[1].setContent(pointsList[0].getContent());
              pointsList[0].setContent(str(s));
              
          }
      }
    }
  }
  
  void display(){
    font = createFont("Comic Sans MS Bold", 25);
    title = file.getChild("title").getContent();
    namesList = file.getChildren("scores/entry/name");
    pointsList = file.getChildren("scores/entry/points");
    
    y = 175;
    textFont(font);
    //text(title, 700, 300);
    
    for(int i = 0; i < pointsList.length; i++){
      String num = str(i+1) + ")";
      name = namesList[i].getContent();
      score = pointsList[i].getContent();
      text(num, 260, y);
      text(name, 285, y);
      text(score, 370, y);
      
      y += 50;
    } 
  }
}