//Game of Life Simulation
//CS30
//Oct, 27, 2017

//globals
int[][] board;
int rows,cols;
float cWidth, cHeight;

void setup() {
  size(600,600);
  
  cols = 20;
  rows = 20;
  
  initializeValues();
  randomizeBoard();
}

void draw() {
  displayBoard();
}

void initializeValues() {
  board = new int[cols][rows];
  cWidth = width/cols;
  cHeight = height/rows;
}

void randomizeBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      board[x][y] = int(random(2));
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    update();
  }
}

void displayBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 1) {
        fill(0); //alive
      }
      else {
        fill(255); //dead
      }
      rect(x*cWidth,y*cHeight,cWidth,cHeight);
    }
  }
}

void update() {
  int[][] next = new int[cols][rows];
  
  //ignore the edges because its easier
  for (int x=1; x<cols-1 ;x++) {
    for (int y=1; y<cols-1 ;y++) {
      
      int neighbors = 0;
      
      for (int i=-1; i<1; i++) {
        for (int j=-1; j<1; j++) {
          neighbors+= board[x+i][y+j];
        }
      }
      
      //don't add the cell itself to the neighbors
      neighbors -= board[x][y];
      
      //apply the rules of the game
      if (board[x][y] == 1) {
        if (neighbors == 2 || neighbors == 3) {
          next[x][y] = 1;
        }
        else {
          next[x][y] = 0;
        }
      }
      if (board[x][y] == 0) {
        if (neighbors == 3) {
          next[x][y] = 1;
        }
        else {
          next[x][y] = 0;
        }
      }
    }
  }
  board = next;
  
}