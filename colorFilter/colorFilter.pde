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
    float newR = 255-r;
    float newG = 255-g;
    float newB = 255-b;
    
    //update pixel array
    pixels[i] = color(newR,newG,newB);
  }
  updatePixels();
  
  //fill(cursorLocation);
  //rect(350,450,100,100);
  
  //fill(255);
  //textSize(18);
  //text("R: " + red(cursorLocation), 350, 600);
  //text("G: " + green(cursorLocation), 350, 650);
  //text("B: " + blue(cursorLocation), 350, 700);
  
}