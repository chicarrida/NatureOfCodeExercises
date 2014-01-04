float global;

void setup(){
  size(800, 600);
  global = 0.02;
}

void draw(){
float xoff = 0.0;
float goff = 10000;

loadPixels();
for(int x= 0; x < width; x++){
  
  
  float yoff = 0.0;
  float gyoff = 10000;  
  for(int y = 0; y < height; y++){
    
    float bright = map(noise(xoff+global, yoff+global), 0, 1, 0, 255);
    float gright = map(noise(goff-global, gyoff-global), 0, 1, 0, 255);
    
    pixels[x+y*width] = color(bright, gright, 0);
    yoff += 0.008;
     gyoff += 0.008;
  }
 xoff += 0.008;
 goff += 0.008;

}
updatePixels();
global -= 0.01;
}
