PImage thePassword;

void setup() {
  size(600,600);
  thePassword = loadImage("passwords.jpg");
}


void draw() {
  background(0);
  
  image(thePassword,0,0);
  
  loadPixels();
  color cursorLocation = pixels[mouseY*width + mouseX];
  
  fill(cursorLocation);
  rect(350,450,100,100);
  
}