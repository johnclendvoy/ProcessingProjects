/*
Author: John C. Lendvoy

Controls:
=========

s/w = static
b = start a black face
g = start a green face

up/ down = control speed
left = reset speed
k = kill, stop all movement

*/
int WINDOW_WIDTH;
int WINDOW_HEIGHT;



int startNextSize;
int maxSize;
float growthRate;
int randomStatic;

color blackColor = color(0);
color whiteColor = color(255);
color greenColor = color(0, 111, 0);

String songTitle;
PFont titleFont;
color fontColor;
int titleFontSize;


Face faceArray[];

void setup() {

   songTitle = 
   "GRIND\n"
  +"CODEZILLLA\n"
  +"FLY REAL HIGH (2016)\n"
  +"SOUNDCLOUD.COM/CODEZILLLA";
   fontColor = color(0,200,0);
  titleFontSize = 16;
  titleFont = createFont("codezilllaFontmo.ttf", titleFontSize, true);
  
  
  growthRate = 5;
  randomStatic = 10;

  faceArray = new Face[5];
  //init face array
  faceArray[0] = new Face(greenColor);

  size(1280,720);
  background(blackColor);
  
  WINDOW_WIDTH = width;
  WINDOW_HEIGHT = height;
  
  startNextSize = WINDOW_WIDTH/2;
  maxSize = WINDOW_WIDTH;
  

  
  
}

void draw() {

  for (int i = 0; i< faceArray.length; i++) {


    if ( faceExists(faceArray[i])) {
      moveFace(faceArray[i]); 

      if (faceArray[i].width >= startNextSize) {
        if (!faceExists(faceArray[(i+1)%faceArray.length])) {
          if (faceArray[i].faceColor == greenColor) {

            faceArray[(i+1)%faceArray.length] = new Face(blackColor);
          } else {
            faceArray[(i+1)%faceArray.length] = new Face(greenColor);
          }
        }
      }

      if (faceArray[i].width >= maxSize) {
        //background(faceArray[i].faceColor);
        faceArray[i] = null;
      }
      
    }
  }
  
  //show whitnoise
  loadPixels();
for (int i = 0; i <pixels.length; i++) {
  if( random(0, 100) < randomStatic){
  pixels[i] = blackColor;
  }
}
updatePixels();

 //paint hud
  textFont(titleFont, titleFontSize);
  fill(fontColor);
  //show song title
  text(songTitle, 10, height-70);
}

boolean faceExists(Face f) {
  if (f == null) {
    return false;
  } else {
    return true;
  }
}


void moveFace(Face f) {
  f.setPosition((WINDOW_WIDTH/2 - f.width/2), (WINDOW_HEIGHT/2 - f.height/2));
  f.setSize( f.width + growthRate, f.height + growthRate );
  f.drawFace();
}


void mousePressed() {
}

void keyPressed() {
  if(key == CODED){
    
    //increase speed
    if(keyCode == UP ){
      growthRate = growthRate + 0.1;
    }
    
    //decrease speed
    else if (keyCode == DOWN){
      growthRate = growthRate -0.1;
    }
    
     //reset speed
    if(keyCode == LEFT ){
      growthRate = 1;
    }
    
  }
  
  else { //not coded
  
    //kill. stop all movement
    if (key == 'k'){
      randomStatic = 0;
      for (int i =0; i < faceArray.length; i++){
        faceArray[i] = null;
      }
    }
    
    //resetw black bg
     else if (key == 'b'){
      for (int i =0; i < faceArray.length; i++){
        faceArray[i] = null;
      }
      faceArray[0] = new Face(greenColor);
     background(blackColor);
    }
    
     //resetw green bg
     else if (key == 'g'){
      for (int i =0; i < faceArray.length; i++){
        faceArray[i] = null;
      }
      faceArray[0] = new Face(blackColor);
     background(greenColor);
    }
    
    
    //increase static
     else if (key == 'w'){
       if(randomStatic < 100){
         randomStatic++;
       }
      }
    
    //decrease static
     else if (key == 's'){
       if(randomStatic >=0){
         randomStatic--;
       }
      }
     
    }
    
    println("static: " + randomStatic + "    speed: " +growthRate );
}