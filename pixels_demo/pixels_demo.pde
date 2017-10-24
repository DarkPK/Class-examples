
void setup() {
  size(600,600);
  
  loadPixels(); //gives us acces to the pixels[]
  
  //look at every pixel in the array
  for (int i=0; i<pixels.length; i++) {
    pixels[i] = color(0);
  }
  
  //save the modified array back to pixels
  updatePixels();
  
}

void draw() {
  
}