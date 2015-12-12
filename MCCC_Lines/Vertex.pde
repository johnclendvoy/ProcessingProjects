class Vertex {
  
//position
float x, y;

//speed
float dx, dy;
float basedx, basedy;

//size
int size;

//constructor
public Vertex(float newX, float newY) {
  this.x = newX;
  this.y = newY;
  this.dx = 0;
  this.dy = 0;
  this.size = 10;
  
}

public void setBaseSpeed(float newDx, float newDy){
   this.basedx = newDx;
   this.basedy = newDy;
    this.dx = newDx;
    this.dy = newDy;
}

public void setSpeed (float newDx, float newDy){
   this.dx = newDx;
   this.dy = newDy;
}

public void setSize (int s){
  this.size = s;
}

public void move(){
  this.x += this.dx;
  this.y += this.dy;
  
  
  if(y ==0 && x >= width){ //top right corner
    this.x = width;
    setSpeed(0, sideSpeed); //move down
  }
  else if(x == width && y >= height){ //bottom right corner
    this.y = height;
    setSpeed(-topSpeed, 0); //move left
  }
  else if(y == height && x <= 0){ //botom left corner
    this.x = 0;
    setSpeed(0, -sideSpeed); //move up
  }
  else if(x ==0 && y <=0 ){ //top left corner
    this.y = 0;
    setSpeed(topSpeed, 0); //move right
  }
  
}

public void drawVertex(){
  // fill(0, 200, 0);
 //  stroke(0, 200, 0);
   ellipse(this.x, this.y, this.size, this.size);
}
  
  
}