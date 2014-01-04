PVector wind;
PVector gravity;
float perlin = 0.004;
float noiseVal;
Mover[] movers;

void setup(){
   size(600, 400);   
   wind = new PVector(0, 0);
   movers = new Mover[15];
   for(int i = 0; i < movers.length; i++){
      movers[i] = new Mover(); 
   }
   //frameRate(12);
}

void draw(){
  background(125);
 updateNoise();   
 for(Mover mover: movers){
 gravity = new PVector(0, 0.1);
 gravity.mult(mover.MASS); 
  mover.applyForce(gravity);
  mover.applyForce(wind);  
  mover.update();
  mover.render();
  mover.checkEdges();
 }
}

void updateNoise(){
  noiseVal = noise(perlin);
  wind.x = noiseVal*0.007;
  wind.y = noiseVal*-0.002;
  perlin += 0.001; 
}
