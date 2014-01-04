class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rotationAngle;
  boolean statik = false;  
  boolean tooClose = false;
  color c; 
  
  Mover(){
  location = new PVector(width/2, height/2);
  velocity = new PVector(0,0);
  c = color((int)random(50), (int)random(150), (int)random(255), 150);
  acceleration = new PVector(0.05, 0.05);
  }
  
  void setLocation(PVector newLocation){
    location = newLocation;
  }
  

  
 void update(){
   PVector dir = new PVector(mouseX, mouseY);
   dir.sub(location);
  
   if(dir.mag() < (50 + random(20)))
      tooClose = true;
   else 
     tooClose = false; 
     
   dir.setMag(map(dir.mag(), 0, 350, 0,20));    
   //das hier ist sehr wichtig :-)
   rotationAngle = atan2(dir.y, dir.x);
   
   if(tooClose)
     return;
     
   velocity.add(dir);
   velocity.add(acceleration);
   location.add(velocity);
   velocity.limit(5);
    velocity.add(new PVector(random(5), random(5)));   
  }
 
  
  void edges(){
    if (location.x > width)
      location.x = 0;
    if(location.x < 0)
      location.x = width;
    if(location.y > height)
      location.y = 0;
    if(location.y < 0)
      location.y = height;
  }
  
  void render(){
    pushMatrix();
   translate(location.x, location.y);
    rotate(rotationAngle);
   // rotate(PI/2);
   fill(c);
  //noStroke();
  stroke(55);
  //triangle(-5, 5, 0, -10, 5, 5);
  triangle(-5, 5, -5, -5, 10, 0);
  popMatrix(); 
  }
  
}
