//the variables for the line that is going to make it move up and down. This is going to represent first paddle
float y=350;
float y2=450;
//the x value and y value of the circle that is supposed to represent the ball and these values will change to make the ball move.
float circleX=width/2;
float circleY=height/2;
// these are the values for the circle and they determine at what slope circle will move.
// I also need these variables to change them when the ball hits the wall
float circleX2=11;
float circleY2=8;
PFont f;
//the variable for the #of lives left
int lives=3;
void setup() {
  size(800, 800);
  f = createFont("Arial",16,true);
}

void draw() {
  background(0);
  strokeWeight(15);
  stroke(255);
  //this is the first paddle
  line(7.5, y, 7.5, y2);
  fill(0, 150, 150);
  strokeWeight(0);
  //the ball
  circle(circleX, circleY, 20);
  //the rate at wich the ball moves every repition
  circleX+=circleX2;
  circleY+=circleY2;
  //These next two statments change the direction of the ball when it hits the wall
  //It just makes either the x slope or the y slope negative
  if (circleX>=780 || circleX<=20) {
    circleX2=-circleX2;
  }

  if (circleY>=780 || circleY<=20) {
    circleY2=-circleY2;
  }
  //this if statments makes the program close when the ball does not hit the paddle 3 tiimes
  //the program itself does not detect the paddle at all or cares if there is a paddle at all
  //it just detects that if the y values of the ball match with the paddle and if they do not the programs finishes.
  if (circleX<=20) {
    if (circleY<y-10|| circleY>y2+10){
      lives--;
    }
  }
//when the lives=0 a message will pop up and will give instructions to exit or start again
  if (lives<=0){
    textFont(f,16);
    fill(255,0,0);
    text("YOU LOSE !!!!!!!!!!!!!!!!!!!!!!", 290,400);
    text("Press space to start again",295,450);
    text("Press esc to exit", 315,470);
    //if you press esc than the program closes
    if (keyPressed==true){
      if(key==27){
        exit();
      }
      //when pressing space the lives ball and paddle reset
      if(key==32){
        delay(300);
        lives=3;
        y=350;
        y2=450;
        circleX=width/2;
        circleY=height/2;
  }
    }
  }
 
 textFont(f,16);                  
  fill(255);            
  text("Lives Remaining: "+lives,320,20);
  }
//This is the code to move the paddle up and down.
void keyPressed() {
  if (keyPressed==true) {
    if (key==119) {
      y-=15;
      y2-=15;
    }
    if (key==115) {
      y+=15;
      y2+=15;
    }
  }
}
