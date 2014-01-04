


Walker w;
void setup(){
  size(640, 380);
  w = new Walker();

}

void draw(){
  //background(123);
 
  //w.update();
  w.updateRandomNoise();
  //w.updateRandom();

  w.edges();
  w.render();
 }
