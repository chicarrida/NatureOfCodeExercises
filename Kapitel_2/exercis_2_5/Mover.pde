class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration; 
  color c;
  final float MASS; 
  final int RADIUS = 20;
  
  
  Mover(){
  location = new PVector(random(0,width), 50);
  velocity = new PVector(0,0);
  c = color((int)random(50), (int)random(150), (int)random(255), 150);
  acceleration = new PVector(0, 0);
  MASS = random(.5, 2);
  }
  
  void setLocation(PVector newLocation){
    location = newLocation;
  }
  
 void update(){
   velocity.add(acceleration);
   location.add(velocity);
   velocity.limit(5);   
   acceleration.mult(0);   
  }
 
  void applyForce(PVector force) {
    PVector f = PVector.div(force,MASS);
    acceleration.add(f);
  }
  
  
 /* void edges(){
    //hiermit bin ich noch nicht ganz zufrieden - ich finde da muss noch ein bisschen mehr weg! Nicht nur *-1!
    if (location.x > width -RADIUS/2){
      velocity.x *= -1;
      location.y = width - RADIUS/2;
    }
    else if(location.x <= RADIUS/2){
      velocity.x *= -1;
      location.x = RADIUS/2;
    }
    
    if(location.y > height - RADIUS/2){
       velocity.y *= -1; 
       location.y = height - RADIUS/2;
    }           
    else if(location.y <= RADIUS/2){
      velocity.y *= -1;
      location.y = RADIUS/2;      
    }  
  }
 */
 
 void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
  
  void render(){
    fill(c);
    stroke(55);
    ellipse(location.x, location.y, RADIUS*MASS, RADIUS*MASS);
  }
}
