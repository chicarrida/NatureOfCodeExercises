PVector wind;
PVector gravity;
float perlin = 0.004;
float noiseVal;
Mover[] movers;
float fCoeff = 0.1;

void setup(){
   size(600, 400);   
   wind = new PVector(0, 0);
   movers = new Mover[15];
   for(int i = 0; i < movers.length; i++){
      movers[i] = new Mover(); 
   }
   rectMode(CORNER);
   //frameRate(12);
}

void draw(){
  background(125);
  fill(230);
  rect(0, height/2  , width, 100);
 updateNoise();   
 for(Mover mover: movers){
 gravity = new PVector(0, 0.1);
 gravity.mult(mover.MASS); 
 mover.applyForce(gravity);
 //mover.applyForce(wind);
if(inRect(mover.location))
{ 
   PVector friction = mover.velocity.get();
  friction.normalize();
  friction.mult(-fCoeff);
  mover.applyForce(friction);
}
  mover.update();
  mover.render();
  mover.checkEdges();
 }
}
 boolean inRect(PVector loc){
   
   if(loc.y > height/2 && loc.y < height/2 + 100)
    return true;
   else
    return false; 
   
 }
void updateNoise(){
  noiseVal = noise(perlin);
  wind.x = noiseVal*0.007;
  wind.y = noiseVal*-0.002;
  perlin += 0.001; 
}
