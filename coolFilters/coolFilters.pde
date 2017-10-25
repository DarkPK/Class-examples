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
    
    float r = red(thisPixel);
    float g = green(thisPixel);
    float b = blue(thisPixel);
    
    //change RGB values! Write your filter here
    float newR = r;
    float newG = g;
    float newB = r;
    
    //update pixel array
    pixels[i] = color(newR,newG,newB);
  }
  updatePixels();
}