class Walker{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float tx, ty, tStep;
  
  
  Walker(){
  location = new PVector(width/2, height/2);
  velocity = new PVector(0,2);
  acceleration  = new PVector(0.05, -0.03);
  tx = 1000;
  ty = 10000;
  tStep = 0.03;
  }
  
  void updateRandom(){
    acceleration  = PVector.random2D();
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);       
  } 
  
  
  void updateRandomNoise(){
    //
    acceleration.x = map(noise(tx), 0,1,-5,5);
    acceleration.y = map(noise(ty), 0,1,-1,1);
    acceleration.mult(0.01);
    tx += tStep;
    ty += tStep;
    
    velocity.add(acceleration);
    velocity.limit(1); 
    location.add(velocity);
     
  }
  
  void update(){    
    velocity.add(acceleration);
    velocity.limit(5);   
    location.add(velocity);
    
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
   fill(20, 60, 100, 120);
  noStroke();
 ellipse(location.x, location.y, 20, 20); 
  }
}

