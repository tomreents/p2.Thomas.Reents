button gas;
button Break;
button odometer;
button Park;
button Reverse;
button Nutral;
button Drive;
button Manual; 
button cruise;
button cruiseSet;
button Brights;
button right;
button left;
button hazard;
PImage tire;
PImage airBag;
PImage haz;
PImage gasLogo; 
PImage cruiseOn;
PImage brights;
PImage arrowR;
PImage arrowL;
PImage engine;
PImage oil;
PImage temp;
boolean brightsPressed = false;
boolean breakPressed = false; 
boolean gasPressed = false;
boolean parkPressed = true;
boolean reversePressed = false;
boolean nutralPressed = false;
boolean drivePressed = false;
boolean manualPressed = false; 
boolean cruisePressed = false;
boolean cruiseSetPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean hazardPressed = false;
int mph = 0;
int k;
int k1;
int con = 500;
int start;
int pos = 700;
int setSpeed; 
float rpm;

void setup() {
  size(1500, 1000);
  smooth();
  gas = new button(50, 700, 100, 70, "Gas", 15);
  Break = new button(160, 700, 100, 70, "Break", 15);
  Park = new button(280, 700, 70, 70, "P", 30);
  Reverse = new button(360, 700, 70, 70, "R", 30);
  Nutral = new button(440, 700, 70, 70, "N", 30);
  Drive = new button(520, 700, 70, 70, "D", 30);
  Manual = new button(600, 700, 70, 70, "M", 30);
  cruise = new button(680, 700, 120, 70, "Cruise\nControl on/off", 15);
  cruiseSet = new button(810, 700, 70, 70, "Set", 20);
  Brights = new button(900, 700, 80, 70, "Lights", 20);
  odometer = new button(620, 580, 250, 70, "150,347 mi", 40);
  right = new button(1080, 700, 70, 70,"->", 20);
  left = new button(1000, 700, 70, 70,"<-", 20);
  hazard = new button(1200, 700, 80, 70, "Hazards", 15);
  gasLogo = loadImage("gas.png");
  cruiseOn = loadImage("cruise.png");
  brights = loadImage("bright.png");
  arrowR = loadImage("arrowR.png");
  arrowL = loadImage("arrowL.png");
  engine = loadImage("engine.png");
  oil = loadImage("engine-oil-level.png");
  haz = loadImage("haz.png");
  tire = loadImage("tire-pressure.png");
  airBag = loadImage("airbag-off.png");
}

void draw() {
  background(50);
  hazard.display(10, 30);
  right.display(20, 30);
  left .display(20, 30);
  cruise.display(5, 20);
  cruiseSet.display(20, 30);
  Brights.display(10, 30); 
  gas.display(20, 30);
  Break.display(20, 30);
  Park.display(20, 30);
  Reverse.display(20, 30);
  Nutral.display(20, 30);
  Drive.display(20, 30);
  Manual.display(20, 30);
  odometer.display(12, 45);
  displayMPH();
  image(oil, 950, 300, 60, 60);
  image(engine, 450, 300, 60, 60);
  image(tire, 120, 200, 50, 50);
  image(airBag, 1300, 200, 50, 50);
  
  
  rpm = (mph*5280)/(6.28*60);
  textSize(20);
  text("Outside", 460, 500);
  text("Engine", 960, 500);
  textSize(40);
  text("72 °F", 450, 480);
  text("195 °F", 930, 480);
  text(rpm, 55, 500);
  textSize(30);
  text("rpm", 90, 550);
  
  if(hazardPressed == true) {
    if((millis()/400) % 2 == 0){
      image(arrowL, 50, 50, 80, 80);
      image(arrowR, 1350, 50, 80, 80);
    }
    image(haz, 715, 50, 50, 50);
  }
  if(leftPressed == true){
    if((millis()/400) % 2 == 0)
      image(arrowL, 50, 50, 80, 80);
  }
  if(rightPressed == true){
    if((millis()/400) % 2 == 0)
      image(arrowR, 1350, 50, 80, 80);
  }
  if(brightsPressed == true)
    image(brights, 520, 80, 60, 60);
  if(cruisePressed == true)
    image(cruiseOn, 900, 80, 60, 60);
  textSize(100);
  text("mph", 635, 530);
  image(gasLogo, 1113, 590, 50, 50);
  textSize(50);
  text("F", 1200, 155);
  text("E", 1200, 590);
  rect(1100, 130, 80, 112.5, 10, 10, 0, 0);
  rect(1100, 242.5, 80, 56.25);
  fill(120, 200, 255);
  rect(1100, 298.75, 80, 56.25);
  rect(1100, 355, 80, 112.5);
  rect(1100, 467.5, 80, 112.5, 0, 0, 10, 10);
  
  textSize(60);
  
  if(parkPressed == true)
    fill(120, 200, 100);
  else 
    fill(255);
  text("P", 300, 185);
  
  if(reversePressed == true)
    fill(120, 200, 100);
  else 
    fill(255);
  text("R", 300, 285);
  
  if(nutralPressed == true)
    fill(120, 200, 100);
  else 
    fill(255);
  text("N", 300, 385);
  
  if(drivePressed == true)
    fill(120, 200, 100);
  else 
    fill(255);
  text("D", 300, 485);
  
  if(manualPressed == true)
    fill(120, 200, 100);
  else 
    fill(255);
  text("M", 300, 585);
  
  
}

void mousePressed() {
  if (gas.overButton()) {
    if(parkPressed == false && nutralPressed == false) {
      gasPressed = true;
      gas.value = 255;
      gas.textFill = 0;
      k1 = millis()/200;
      start = mph;
    }
  }
  if(Break.overButton()){
    if(cruisePressed == true){
      cruisePressed = false;
      cruiseSetPressed = false; 
    }
    breakPressed = true;
    Break.value = 255;
    Break.textFill = 0;
    start = mph;
    con = 50;
    k1 = millis()/con;
  }
  
  if(Park.overButton()){
    parkPressed = true;
    reversePressed = false;
    nutralPressed = false; 
    drivePressed = false;
    manualPressed = false; 
  }
  if(Reverse.overButton()){
    parkPressed = false;
    reversePressed = true;
    nutralPressed = false; 
    drivePressed = false;
    manualPressed = false;
  }
  
  if(Nutral.overButton()){
    parkPressed = false;
    reversePressed = false;
    nutralPressed = true; 
    drivePressed = false;
    manualPressed = false;
  }
  
  if(Drive.overButton()){
    parkPressed = false;
    reversePressed = false;
    nutralPressed = false; 
    drivePressed = true;
    manualPressed = false;
  }
  
  if(Manual.overButton()){
    parkPressed = false;
    reversePressed = false;
    nutralPressed = false; 
    drivePressed = false;
    manualPressed = true;
  }
  
  if(cruise.overButton()){
    if(cruisePressed == true) {
      cruisePressed = false;
      if(cruiseSetPressed == true){
        cruiseSetPressed = false; 
      }
    }
    else
      cruisePressed = true;
  }
  if(cruiseSet.overButton()){
    if(cruisePressed == true){
      cruiseSetPressed = true;
      setSpeed = mph;
    }
  }
  
  if(Brights.overButton()){
    if(brightsPressed == true)
      brightsPressed = false;
    else 
      brightsPressed = true;
  }
  
  if(left.overButton()){
    rightPressed = false;
    if(leftPressed == true)
      leftPressed = false;
    else 
      leftPressed = true;
  }
  
  if(right.overButton()){
    leftPressed = false;
    if(rightPressed == true)
      rightPressed = false;
    else 
      rightPressed = true;
  }
  
  if(hazard.overButton()){
    if(hazardPressed == true)
      hazardPressed = false;
    else 
      hazardPressed = true;
  }
}

void mouseReleased() {
  if(gasPressed == true) {
    gasPressed = false;
    gas.value = 0;
    gas.textFill = 255;
    start = mph;
    con = 600;
    k1 = millis()/600;
  }
  if (breakPressed == true) {
    breakPressed = false;
    Break.value = 0;
    Break.textFill = 255;
    start = mph;
    con = 600;
    k1 = millis()/con;
  }
}

void displayMPH() {
  fill(255);
  textSize(300);
  if(mph > 99)
    pos = 450;
  else if(mph > 9)
    pos = 550;
  else 
    pos = 650; 
  text(mph, pos, 400);
  k = millis()/200;
  if (gasPressed == true) {
      if(mph < 200) {
        mph = k - k1 + start;
      }
  }
  if (gasPressed == false) {
    if(mph > 0){
      if(cruiseSetPressed == false)
        mph = start + k1 - (millis()/con);
      if(cruiseSetPressed == true && mph != setSpeed)
        mph = start + k1 - (millis()/con);
    }
  }
}

class button {
  float x;
  float y;
  float w; 
  float h;
  int value = 0;
  int textFill = 255;
  int sizeText;
  String title;
  boolean pressed = false;
  
  button(float x, float y, float w, float h, String title, int sizeText){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.title = title; 
    this.sizeText = sizeText;
  }
  void display(int x1, int y1) {
    fill(value);
    rect(x, y, w, h, 7);
    fill(textFill);
    textSize(sizeText);
    text(title, x + x1, y + y1);
  }
  
  boolean overButton()  {
    if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }
}
