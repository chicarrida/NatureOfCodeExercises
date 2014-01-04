// The Nature of Code
// Daniel Shiffman
// Draft book

// Example 1-1: Bouncing Ball, no vectors
float x = 100;
float y = 100;
float xspeed = 1.5;
float yspeed = 1;

PVector location;
PVector speed;

void setup() {
  size(800, 200);
  location = new PVector(300, 100);
  speed = new PVector(2.5, 2);
  smooth();
}

void draw() {
  background(255);


  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;
  
  location.add(speed);
  if ((x+24 > width) || (x-24 < 0)) {
    xspeed = xspeed * -1;    
  }
  if ((y+24> height) || (y-24 < 0)) {
    yspeed = yspeed * -1;
  }
if ((location.x+24 > width) || (location.x-24 < 0)) {
  speed.x = speed.x *-1;    
  }
  if ((location.y+24> height) || (location.y-24 < 0)) {   
    speed.y = speed.y * -1;
  }
  //sehr rudimentär - eigentlich muss man ja den vektor noch in die richtung drehen... später...
  if(Math.abs(location.x - x) < 30&& Math.abs(location.y -y) < 30){
    speed.mult(-1);
    xspeed *= -1;
    yspeed *= -1;
   /// println("x: "+Math.abs(location.x - x));
    //println("y: "+Math.abs(location.y - y));
  }  

  // Display circle at x location
  stroke(0);
  strokeWeight(2);
  fill(127);
 // ellipse(x, y, 48, 48);
  ellipse(location.x, location.y, 48, 48);
}
