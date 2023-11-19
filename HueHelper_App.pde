float hue;
color c, oldCol, c1, c2;
float xPos;
float yPos;

float oldX, oldY, oldHue, hueDif;

void setup() {
  size(600, 600);
  
  pixelDensity(2);  
}
 
void draw() {
  
  background(0);
  
  colorMode(HSB);
  
  printObd();

  xPos = mouseX - width/2;
  yPos = -(mouseY - height/2);
  hue = atan2(yPos, xPos); // atan2(y, x) lets you get the angle
  hue = map(hue, -PI, PI, 0, 255);
  c = color(hue, 255, 255);
  
  c2 = c;
  
  
  printColInfo();
  
  fill(c);
  noStroke();
  
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 10, 10);
 
  stroke(c);
  line(width/2, height/2, mouseX, mouseY);
  noStroke();
  
  fill(0);
  rect(mouseX + 15, mouseY - 10, 35, 15);
  
  fill(c);
  textSize(10);
  text(int(map(hue, 0, 255, 0, 65535)), mouseX + 15, mouseY);
  

  
  
  if(oldX != 0){
    
    fill(oldCol);
    noStroke();
    
    ellipseMode(CENTER);
    ellipse(oldX, oldY, 10, 10);
    
    stroke(oldCol);
    line(width/2, height/2, oldX, oldY);
    noStroke();
    
    
    
    textSize(10);
    
    fill(0);
    rect(oldX + 15, oldY - 15, 35, 15);
    fill(oldCol);
    text(int(map(oldHue, 0, 255, 0, 65535)), 15 + oldX, oldY);
   
    fill(0);
    rect(mouseX + 15, mouseY + 5, 35, 15);
    fill(50, 50, 255);
    text(int(getHueGap()), mouseX + 15, mouseY + 15);
    


    //print(hue + "\t" + oldHue +"\n");
  }
  
  //r = red(c);
  //g = green(c);
  //b = blue(c);
 
  //print(r); print('\t'); print(g); print('\t'); println(b);
}  

int radius = 100;
int pathRadius = 150;

int iterations = 511;


void printPath(){
  
  strokeWeight(2);
  
  
    
  
    
  for(int i = 0; i < iterations; i++){

    color co = color(map(i, 0, iterations, 0, 255), 255, 255);
    
    fill(co);
    stroke(co);
    
    point(radius * sin(map(i, 0, iterations, -PI, PI) + HALF_PI) + 300, radius * cos(map(i, 0, iterations, -PI, PI) + HALF_PI) + 300);
  }
  strokeWeight(1);
  
  
  
  
}


void printObd(){
  
  
  strokeWeight(2);

  for(int i = 0; i < iterations; i++){

    color co = color(map(i, 0, iterations, 0, 255), 255, 255);
    
    fill(co);
    stroke(co);
    
    point(radius * sin(map(i, 0, iterations, -PI, PI) + HALF_PI) + 300, radius * cos(map(i, 0, iterations, -PI, PI) + HALF_PI) + 300);
  }
  strokeWeight(1);
}


void mouseClicked(){
  
  if(oldX == 0){
    
    oldX = mouseX;
    oldY = mouseY;
    
    oldHue = atan2(oldX - width / 2, -(oldY - height/2)); // atan2(y, x) lets you get the angle
    oldHue = map(oldHue, - PI + HALF_PI, PI  + HALF_PI, 255, 0) % 255;
    
    oldCol = color(oldHue, 255, 255);    
    
    c1 = oldCol;
  }
  else{
    
    oldX = 0;
  }
  
  
}


void printColInfo(){
  
  fill(50, 50, 255);
  text("Col 1       ->", 10, 20);
  //text("Col 1", 10, 20);
  //text("Col 2", 10, 40);
  
  
  noStroke();
  
  fill(c1);
  ellipse(50, 17, 10, 10);
  
  fill(c2);
  ellipse(80, 17, 10, 10);
}

float getHueGap(){
  
  int hueGap = int(map(hue - oldHue, 0, 255, 0, 65535));
  
  if(hueGap > 32767){
  
    hueGap = int((hueGap % 32767) - 32767);
  }
  
  if(hueGap < -32767){
  
    hueGap = int(32767 + (hueGap % 32767));
  }
  
  //println(map(oldHue, 0, 255, 0, 65535) + "\t" + (map(oldHue, 0, 255, 0, 65535) + hueGap));
  
  //float startDeg = map(oldHue, 0, 255, PI, -PI);
  //float degSpread = hueGap > 0 ? map(hueGap, 0, 32767, 0, PI) : PI;
  
  //println(startDeg + "\t    " + degSpread);
  
  //noFill();
  //stroke(100, 90, 255);
  //arc(width / (float) 2, height / (float) 2, 150, 150, startDeg, degSpread, OPEN);

  //if(hueGap < 0){
    
  //  hueGap *= -1;
  //  gapAdjusted = true;
  //}
  

  
  
  return hueGap;
}
