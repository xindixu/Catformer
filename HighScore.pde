class HighScore{
  PFont font;
  int y;
  Table hs;
  
  HighScore(){
    hs = loadTable("score/highscores.csv","header");
  }
  
  void update(String n,int s){
    TableRow newRow = hs.addRow();
    newRow.setString("Name", n);
    newRow.setInt("Score", s);
    hs.sort("Score");
    saveTable(hs, "data/score/highscores.csv");
    
  }
  
  void display(){
    font = createFont("Comic Sans MS Bold", 25);
    y = 175;
    textFont(font);
    int index = hs.getRowCount();
    int i = index-1;
    while(i>index-6){
      TableRow r = hs.getRow(i);
      int s = r.getInt("Score");
      String n = r.getString("Name");
      fill(0);
      text(s,350,y);
      text(n,290,y);
      y+=50;
      i--;
    }
  }
}