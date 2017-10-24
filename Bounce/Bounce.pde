// State Variables Demo
// Sept 28, 2017

//globals
float buttonX, buttonY, buttonWidth, buttonHeight;
float buttonTop, buttonBottom, buttonLeftSide, buttonRightSide;
float[] ballX, ballY, ballSize, dxBall, dyBall;
float[] r,g,b;
int numberOfBalls;
int state;
int bounceCounter;

void setup() {
  //size(800, 800);
  fullScreen();

  state = 0;
  bounceCounter = 0;
  numberOfBalls = 10;

  //declare where the button should be
  buttonX = width/2;
  buttonY = height/2;
  buttonWidth = 600;
  buttonHeight = 200;

  //calculate sides of button
  buttonTop = buttonY;
  buttonBottom = buttonY + buttonHeight;
  buttonLeftSide = buttonX;
  buttonRightSide = buttonX + buttonWidth;
  
  //make space in ram for the arrays
  ballX = new float[numberOfBalls];
  ballY = new float[numberOfBalls];
  ballSize = new float[numberOfBalls];
  dxBall = new float[numberOfBalls];
  dyBall = new float[numberOfBalls];
  r = new float[numberOfBalls];
  g = new float[numberOfBalls];
  b = new float[numberOfBalls];

  //set values for ball
  for (int i = 0; i < numberOfBalls; i++) {
    ballX[i] = random(ballSize[i], width-ballSize[i]);
    ballY[i] = random(ballSize[i], height-ballSize[i]);
    ballSize[i] = random(10,100);
    dxBall[i] = random(-20, 20);
    dyBall[i] = random(-20, 20);
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
  }
}

void draw() {
  background(255);
  if (state == 0) {  //start screen
    displayButton();
  } else if (state == 1) {  //bouncing ball part
    bounceBall();
    detectOtherBall();
    //checkIfGameDone();
  } else if (state == 2) {  //ending screen
    endingScreen();
  }
}

void endingScreen() {
  background(0);
  fill(255);
  textSize(72);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2, height/2);

  textSize(30);
  text("Press any key to reset the game", width/2, height/2 + 75);
}

void checkIfGameDone() {
  if (bounceCounter >= 10) {
    state = 2;
  }
}

void bounceBall() {
  //move ball
  for (int i = 0; i < numberOfBalls; i++) {
    ballX[i] += dxBall[i];
    ballY[i] += dyBall[i];
  

    bounceIfRequired(i);
    displayBounces();

    //display ball
    fill(r[i],g[i],b[i]);
    ellipse(ballX[i], ballY[i], ballSize[i], ballSize[i]);
  }
}

void displayBounces() {
  textAlign(LEFT);
  textSize(32);
  text(bounceCounter, 25, 50);
}

void bounceIfRequired(int ballNumber) {
  //is it hitting the right or left side?
  if ( (ballX[ballNumber] > width - ballSize[ballNumber]/2) || (ballX[ballNumber] < 0 + ballSize[ballNumber]/2) ) {
    dxBall[ballNumber] *= -1;
    //bounceCounter++;
  }

  //is it hitting the top or bottom?
  if ( (ballY[ballNumber] > height - ballSize[ballNumber]/2) || (ballY[ballNumber] < 0 + ballSize[ballNumber]/2) ) {
    dyBall[ballNumber] *= -1;
    //bounceCounter++;
  }
}

boolean mouseIsOnButton() {
  return ((mouseX > width/2 - 300) &&
    (mouseX < width/2 + 300) &&
    (mouseY > height/2 - 150) &&
    (mouseY < height/2 + 150));
}

void displayButton() {
  if (mouseIsOnButton() ) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  rectMode(CENTER);
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
}

void mousePressed() {
  if (mouseIsOnButton()) {
    background(255);
    state = 1;
  }
}

void keyPressed() {
  if (state == 2) { //if on ending screen
    state = 0;
    bounceCounter = 0;
  }
}

void detectOtherBall() {
  for (int i = 0; i < numberOfBalls; i++) {
    for (int o = 0; o < numberOfBalls; o++) {
      //don't check for collision with itself
      if ( i != o) {
        float distanceBetweenBalls = dist(ballX[i],ballY[i],ballX[o],ballY[o]);
        float sumOfRadii = ballSize[i]/2 + ballSize[o]/2;
        
        if (distanceBetweenBalls <= sumOfRadii) {
          bounceCounter++;
          
          float tempdx = dxBall[i];
          float tempdy = dyBall[i];
          
          dxBall[i] = dxBall[o];//*= -1;
          dyBall[i] = dxBall[o];//*= -1;
          
          dxBall[o] = tempdx;
          dyBall[o] = tempdy;
          
          //Hacky method
          //move by one step to avoid a second collision
          ballX[i] += dxBall[i];
          ballY[i] += dyBall[i];
          
          ballX[o] += dxBall[o];
          ballY[o] += dyBall[o];
        }
      }
    }
  }
}