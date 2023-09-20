int[][] buttonValues = new int[4][3];
boolean[][] buttonPressed = new boolean[4][3];
int totalValue = 0;
int numpadWidth = 400;
int numpadHeight = 400;

void setup() {
  size(800, 800);
  initializeButtonValues();
  calculateTotalValue();
}

void draw() {
  background(220);
  drawNumberPad();
}

void initializeButtonValues() {
  for (int row = 0; row < 4; row++) {
    for (int coloumn = 0; coloumn < 3; coloumn++) {
      buttonValues[row][coloumn] = (2-row) * 3 + (coloumn + 1);
    }
  }
  buttonValues[3][1] = 0;
}
void drawNumberPad() {
  float rectWidth = numpadWidth / 3;
  float rectHeight = numpadHeight / 4;

  for (int row = 0; row < 4 && row != 5  ; row++) {
    for (int coloumn = 0; coloumn < 3; coloumn++) {
      float x = coloumn * rectWidth + width / 4;
      float y = row * rectHeight + height / 4;
      boolean isMouseOver = mouseX >= x && mouseX <= x + rectWidth && mouseY >= y && mouseY <= y + rectHeight;
      fill(isMouseOver ? color(200) : color(255));
      rect(x, y, rectWidth, rectHeight);

      fill(0);
      textSize(32);
      textAlign(CENTER, CENTER);
      text(buttonValues[row][coloumn], x + rectWidth /2, y + rectHeight /2);
    }
  }
}

void mousePressed() {
  for (int row = 0; row < 4; row++) {
    for (int coloumn = 0; coloumn < 3; coloumn++) {
      float x = coloumn * (numpadWidth/3) + width / 4;
      float y = row * (numpadHeight /4) + height / 4;
      if (mouseX >= x && mouseX <= x + numpadWidth / 3 && mouseY >= y && mouseY <= y + numpadHeight /4) {
        buttonPressed[row][coloumn] = !buttonPressed[row][coloumn];
        calculateTotalValue();
      }
    }
  }
}

void calculateTotalValue() {
  totalValue = 0;
  for (int row = 0; row <4; row++) {
    for (int coloumn = 0; coloumn < 3; coloumn++) {
      if (buttonPressed[row][coloumn]) {
        totalValue += buttonValues[row][coloumn];
      }
    }
  }
  println(totalValue);
}
