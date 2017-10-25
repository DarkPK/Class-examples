PImage thePassword;

void setup() {
  size(800,800);
  thePassword = loadImage("passwords.jpg");
}


void draw() {
  background(0);
  
  image(thePassword,0,0);
  
  loadPixels();
  color cursorLocation = pixels[mouseY*width + mouseX];
  
  fill(cursorLocation);
  rect(350,450,100,100);
  
  fill(255);
  textSize(18);
  text("R: " + red(cursorLocation), 350, 600);
  text("G: " + green(cursorLocation), 350, 650);
  text("B: " + blue(cursorLocation), 350, 700);
  
}