class CubeRow {
  
  int rowAmount;
  float offs;
  float startX;
  float startY;
  
  
  CubeRow(int amount){
    rowAmount = amount;
    Cube[] row = new Cube[rowAmount];
    for(int i=0; i < row.length; i++){
      row[i] = new Cube();
    }
    
  }
  
  
}
