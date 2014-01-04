class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;

  
  Mover(){
  location = new PVector(width/2, height/2);
  velocity = new PVector(0,0);
  }
  

  
  void update(){
    PVector dir = new PVector(mouseX, mouseY);
    dir.sub(location);
   
    if(dir.mag() < 50)
      return;     
    dir.setMag(map(dir.mag(), 0, 350, 0,20));       
    velocity.add(dir);    
    location.add(velocity);
    velocity.limit(5);   
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
   fill(0, 40, 100);
  noStroke();
 ellipse(location.x, location.y, 40, 40); 
  }
}
