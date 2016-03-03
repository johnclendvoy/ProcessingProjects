
public class Face {
  
  public color faceColor;
  
  public float xPos, yPos, width, height;
  
  public boolean drawSquare[][];
  
 
  
  
  
  public Face(color c) {
    this.faceColor = c;  
    
    drawSquare = new boolean[10][10];
    
  drawSquare[0][0] = false;
  drawSquare[0][1] = false;
  drawSquare[0][2] = true;
  drawSquare[0][3] = true;
  drawSquare[0][4] = true;
  drawSquare[0][5] = true;
  drawSquare[0][6] = true;
  drawSquare[0][7] = true;
  drawSquare[0][8] = true;
  drawSquare[0][9] = true;
  
  drawSquare[1][0] = false;
  drawSquare[1][1] = false;
  drawSquare[1][2] = true;
  drawSquare[1][3] = false;
  drawSquare[1][4] = false;
  drawSquare[1][5] = true;
  drawSquare[1][6] = false;
  drawSquare[1][7] = false;
  drawSquare[1][8] = true;
  drawSquare[1][9] = false;
  
  drawSquare[2][0] = true;
  drawSquare[2][1] = true;
  drawSquare[2][2] = true;
  drawSquare[2][3] = true;
  drawSquare[2][4] = true;
  drawSquare[2][5] = true;
  drawSquare[2][6] = true;
  drawSquare[2][7] = true;
  drawSquare[2][8] = true;
  drawSquare[2][9] = true;
  
  drawSquare[3][0] = true;
  drawSquare[3][1] = false;
  drawSquare[3][2] = true;
  drawSquare[3][3] = false;
  drawSquare[3][4] = true;
  drawSquare[3][5] = true;
  drawSquare[3][6] = true;
  drawSquare[3][7] = true;
  drawSquare[3][8] = true;
  drawSquare[3][9] = false;
  
  drawSquare[4][0] = true;
  drawSquare[4][1] = true;
  drawSquare[4][2] = true;
  drawSquare[4][3] = true;
  drawSquare[4][4] = true;
  drawSquare[4][5] = true;
  drawSquare[4][6] = true;
  drawSquare[4][7] = true;
  drawSquare[4][8] = true;
  drawSquare[4][9] = true;
  
  drawSquare[5][0] = true;
  drawSquare[5][1] = false;
  drawSquare[5][2] = true;
  drawSquare[5][3] = false;
  drawSquare[5][4] = true;
  drawSquare[5][5] = false;
  drawSquare[5][6] = true;
  drawSquare[5][7] = false;
  drawSquare[5][8] = true;
  drawSquare[5][9] = false;
  
  drawSquare[6][0] = false;
  drawSquare[6][1] = false;
  drawSquare[6][2] = false;
  drawSquare[6][3] = false;
  drawSquare[6][4] = false;
  drawSquare[6][5] = false;
  drawSquare[6][6] = false;
  drawSquare[6][7] = false;
  drawSquare[6][8] = true;
  drawSquare[6][9] = true;
  
  drawSquare[7][0] = false;
  drawSquare[7][1] = false;
  drawSquare[7][2] = false;
  drawSquare[7][3] = false;
  drawSquare[7][4] = false;
  drawSquare[7][5] = false;
  drawSquare[7][6] = false;
  drawSquare[7][7] = false;
  drawSquare[7][8] = true;
  drawSquare[7][9] = false;
  
  drawSquare[8][0] = true;
  drawSquare[8][1] = false;
  drawSquare[8][2] = true;
  drawSquare[8][3] = false;
  drawSquare[8][4] = true;
  drawSquare[8][5] = false;
  drawSquare[8][6] = true;
  drawSquare[8][7] = false;
  drawSquare[8][8] = true;
  drawSquare[8][9] = true;
  
  drawSquare[9][0] = true;
  drawSquare[9][1] = true;
  drawSquare[9][2] = true;
  drawSquare[9][3] = true;
  drawSquare[9][4] = true;
  drawSquare[9][5] = true;
  drawSquare[9][6] = true;
  drawSquare[9][7] = true;
  drawSquare[9][8] = true;
  drawSquare[9][9] = false;
  
  }
  
  public void setSize(float w, float h) {
    this.width = w;
    this.height = h;
  }
  
  public void setPosition(float x, float y) {
    this.xPos = x;
    this.yPos = y;
  }
  
  public void drawFace() {
    fill(faceColor);
    
    if(faceColor == color(0, 111, 0)) {
      stroke(0,0,0);
    }
    else{
     stroke(0,111,0); 
    }
    //noStroke();
    
    for(int i = 0; i < 10; i++) {
      for (int j =0; j <10; j++){
        
        if(drawSquare[i][j]){
        rect(this.xPos+(j*this.width/10), this.yPos+(i*this.height/10), this.width/10, this.height/10);
        }
      }
    }
    
  } 

}//end class Face  


