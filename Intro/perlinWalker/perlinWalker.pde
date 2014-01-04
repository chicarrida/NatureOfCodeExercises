class Walker{
  float x,y;
  float tx, ty;
  Walker(){
    tx = 0;
    ty = 10000;
    x= width/2;
    y = height/2;
  }
  
  void step(){
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    tx += 0.02;
    ty += 0.02;
  } 
}

class RandomWalker{
  
 int x; 
 int y;
 int sw, swB;
 int col, colB, colC;

RandomWalker(){
 x = width/2;
  y = height/2; 
 
 sw = -1;
 swB = 1;
 col= 249;
 colB = 31;
 colC = 100;
}

void step(){
  int stepX = int(random(3))-1;
  int stepY = int(random(3))-1;
  x += stepX*2;
  y += stepY*2;
  if(x > width)
    x = width -1;
  else if(x < 0)
    x =0;
  if(y> height)
    y = height -1;
  else if(y < 0)
    y = 0;
  col += sw;
  colB -= sw;
  colC += (swB);
  if(col == 30)
    sw = 1;
  else if(col == 250)
    sw = -1;
  if(colC == 254|| colC == 36)
    swB *= -1;
    
  fill(col, colB, colC, 120);
  //point(x, y);
  ellipse(x,y,2,2);
} 
}

Walker w;
RandomWalker rw;
void setup(){
  size(640, 380);
  w = new Walker();
  rw = new RandomWalker();
  noStroke();
  fill(54, 129, 200);
}

void draw(){
 
  w.step();
  rw.step();
  fill(54, 129, 200, 50);
  ellipse(w.x, w.y, 10, 10);
}
