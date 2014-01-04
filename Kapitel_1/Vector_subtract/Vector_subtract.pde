void setup(){
  size(500, 500);
}

void draw(){
  background(125);
  fill(0);
  
translate(width/2, height/2);
ellipse(0,0,4,4);
ellipse(mouseX, mouseY, 20,20);
PVector center = new PVector(width/2,height/2);
fill(255, 0, 0);
ellipse(center.x, center.y, 20,20);
PVector mouse = new PVector(mouseX, mouseY);

//mouse.x und mouse.y in translate koordinatensyystem gezeichnet!!
stroke(255,0,0);
line(0,0,mouse.x,mouse.y);

mouse.sub(center);
fill(0,255,0);
stroke(0,255,0);
line(0,0,mouse.x, mouse.y);
//line(center.x, center.y, mouse.x, mouse.y);
  
}
