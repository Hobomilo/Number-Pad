int[][] numberPad = new int[4][3]; // 4 rows and 3 columns for the number pad
int timer = 0;
int currentNumber = 0;
boolean timerRunning = false;
int previousTime = 0;
int countdownInterval = 1000; // 1 second in milliseconds

void setup() {
  size(400, 400);
  initializeNumberPad();
  textAlign(CENTER, CENTER);
  textSize(32);
  frameRate(24); // Set the frame rate to 1 frame per second for countdown
}

void draw() {
  background(220);
  drawNumberPad();
  drawTimer();
  
  if (timerRunning) {
    int currentTime = millis();
    if (currentTime - previousTime >= countdownInterval) {
      timer--;
      previousTime = currentTime;
    }
    if (timer <= 0) {
      timer = 0;
      timerRunning = false;
    }
  }
}
void mousePressed() {
  checkButtonClick();
}

void initializeNumberPad() {
  int num = 1;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 3; j++) {
      numberPad[i][j] = num++;
    }
  }
    // Change the "10" button to "Enter"
  numberPad[3][0] = -1; // Use -1 to represent the Enter button
  // Add 0 to the bottom row
  numberPad[3][1] = 0;
}

void drawNumberPad() {
  float padWidth = width * 0.6;
  float padHeight = height * 0.6;
  float startX = (width - padWidth) / 2;
  float startY = (height - padHeight) / 2;

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 3; j++) {
      float x = startX + j * (padWidth / 3);
      float y = startY + i * (padHeight / 4);
      int number = numberPad[i][j];
      boolean hovering = mouseX >= x && mouseX <= x + padWidth / 3 && mouseY >= y && mouseY <= y + padHeight / 4;

      fill(hovering ? 200 : 255);
      rect(x, y, padWidth / 3, padHeight / 4);

      fill(hovering ? 150 : 0);
      text(number, x + padWidth / 6, y + padHeight / 8);
    }
  }
  // Draw the clear button
  float clearX = startX + 2 * (padWidth / 3);
  float clearY = startY + 3 * (padHeight / 4);
  boolean clearHovering = mouseX >= clearX && mouseX <= clearX + padWidth / 3 && mouseY >= clearY && mouseY <= clearY + padHeight / 4;
  fill(clearHovering ? 200 : 255);
  rect(clearX, clearY, padWidth / 3, padHeight / 4);
  fill(clearHovering ? 150 : 0);
  text("C", clearX + padWidth / 6, clearY + padHeight / 8);

  // Display the numbers pressed
  fill(0);
  text("Timer Set to: " + currentNumber, width / 2, height - 20);
}

void drawTimer() {
  fill(0);
  textSize(24);
  text("Timer: " + timer, width / 2, 30);
}

void checkButtonClick() {
  float padWidth = width * 0.6;
  float padHeight = height * 0.6;
  float startX = (width - padWidth) / 2;
  float startY = (height - padHeight) / 2;

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 3; j++) {
      float x = startX + j * (padWidth / 3);
      float y = startY + i * (padHeight / 4);
      if (mouseX >= x && mouseX <= x + padWidth / 3 && mouseY >= y && mouseY <= y + padHeight / 4) {
        int number = numberPad[i][j];
        if (number >= 0 && number <= 9) {
          currentNumber = currentNumber * 10 + number;
        } else if (number == 0) {
          currentNumber = currentNumber * 10;
        }
      }
    }
  }
  // Check for the clear button
  float clearX = startX + 2 * (padWidth / 3);
  float clearY = startY + 3 * (padHeight / 4);
  if (mouseX >= clearX && mouseX <= clearX + padWidth / 3 && mouseY >= clearY && mouseY <= clearY + padHeight / 4) {
    currentNumber = 0;
    timer = 0;
    timerRunning = false;
  }
}

void keyPressed() {
  if (key == '\n' && !timerRunning) { 
    timer = currentNumber;
    currentNumber = 0;
    timerRunning = true;
    previousTime = millis();
  }
}
