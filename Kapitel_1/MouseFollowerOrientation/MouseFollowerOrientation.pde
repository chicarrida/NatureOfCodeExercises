Mover[] triangles;
final int amount = 30;
void setup(){
  size(500, 500);
  triangles = new Mover[amount];
  
  for(int i = 0; i < amount; i++){
  Mover m = new Mover();
  m.setLocation(new PVector((int)random(600),(int)random(600)));
  triangles[i] = m;  
  }
}

void draw(){
  background(125);
   for(int i = 0; i < amount; i++){
     Mover m = triangles[i];
     m.update();
     m.edges();
     m.render();
   }
}
