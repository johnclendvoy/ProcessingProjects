// Monthly Creative Coding Collaboration Submission
// December 2015 - "A Line? A Line!"
// Author: John C. Lendvoy
// john.c.lendvoy@gmail.com


//variables
int pointsPerSide;
int strokeWeight;
float sideSpeed;
float topSpeed;

//data structures
ArrayList<Vertex> leftList, topList, bottomList, rightList;

//colors
color[] lineColors = {#EA5455, #F07B3F, #FFD460, #2D4059};

void setup() {

  //these variables can be set for different effects
  pointsPerSide =10;
  strokeWeight = 2;
  sideSpeed = 3;
  topSpeed = 3;

  size(500, 500);

  leftList = new ArrayList<Vertex>();
  topList = new ArrayList<Vertex>();
  bottomList = new ArrayList<Vertex>();
  rightList = new ArrayList<Vertex>();

  initPoints(pointsPerSide);
}

//set the points in ther starting positions
void initPoints(int pps) {

  // points along left side
  for (int i = height; i > 0; i-= height/pps) {
    Vertex v = new Vertex(0, i);
    v.setSpeed(0, -sideSpeed);
    leftList.add(v);
  }

  //points along top
  for (int i = 0; i < width; i+= width/pps) {
    Vertex v = new Vertex(i, 0);
    v.setSpeed(topSpeed, 0);
    topList.add(v);
  }

  // points along right
  for (int i = 0; i < height; i+= height/pps) {
    Vertex v = new Vertex(width, i);
    v.setSpeed(0, sideSpeed);
    rightList.add(v);
  }

  //points along bottom
  for (int i = width; i > 0; i-= width/pps) {
    Vertex v = new Vertex(i, height);
    v.setSpeed(-topSpeed, 0);
    bottomList.add(v);
  }
}

void draw() {

  background(lineColors[2]);

  //connect one vertex in each list to another
  for (int i = 0; i<pointsPerSide; i++) {

    //different effects
    Vertex vLeft = leftList.get((pointsPerSide-1)-i);
    //Vertex vLeft = leftList.get(i);  //gives a different effect

    Vertex vRight = rightList.get((pointsPerSide-1)-i);
    //Vertex vRight = rightList.get(i); //gives a different effect

    Vertex vTop =topList.get(i);
    Vertex vBottom = bottomList.get(i);

    //draw a line between each vertex
    // stroke(lineColors[i%lineColors.length]); //alternate colors
    stroke(lineColors[3]);
    strokeWeight(strokeWeight);
    line(vTop.x, vTop.y, vLeft.x, vLeft.y); 
    line(vRight.x, vRight.y, vBottom.x, vBottom.y);

    stroke(lineColors[0]); 
    line(vBottom.x, vBottom.y, vLeft.x, vLeft.y); 
    line(vRight.x, vRight.y, vTop.x, vTop.y);

    //update position and speed
    vTop.move();
    vLeft.move();
    vRight.move();
    vBottom.move();
  }

  // take a picture for building the gif
  if (frameCount % 5 == 0 && frameCount < 341) {
    // saveFrame("frames/line-######.png");
  }

  /*
  //see the position of the vertices
   for(Vertex v : topList){
   fill(255);
   v.drawVertex();
   }
   
   for(Vertex v : leftList){
   fill(0,255,0);
   v.drawVertex();
   }
   
   for(Vertex v : bottomList){
   fill(255);
   v.drawVertex();
   }
   
   for(Vertex v : rightList){
   fill(0,255,0);
   v.drawVertex();
   }
   */
}