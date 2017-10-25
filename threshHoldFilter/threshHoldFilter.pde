PImage fish;

void setup() {
  size(500,300);
  fish = loadImage("fish.jpg");
}


void draw() {
  background(0);
  
  image(fish,0,0);
  
  loadPixels();
  
  //loop through the pixels one at a time, single loop
  for (int i=0; i<pixels.length; i++) {
    color thisPixel = pixels[i];
    
    float brightnessLevel = brightness(thisPixel);
    
    if (brightnessLevel > map(mouseX,0,width,0,255)) {
      pixels[i] = color(0);
    }
    else {
      pixels[i] = color(255);
    }
  }
  updatePixels();
}