//Global Variables
int appWidth, appHeight;
float x0, x1, x2, x3, y0, y1, y2, y3, y4, widthSquare, heightSquare;
void setup() {
  size (800, 1200);
  appWidth = width;
  appHeight = height;

  widthSquare = appWidth*1/8;
  heightSquare = appHeight*1/8;
  x0 = appWidth*5/16;
  x1 = appWidth*7/16;
  x2 = appWidth*9/16;
  x3 = appWidth*11/16;
  y0 = appHeight*3/16;
  y1 = appHeight*5/16;
  y2 = appHeight*7/16;
  y3 = appHeight*9/16;
  y4 = appHeight*11/16;
  //Population
  rect(x1, y3, widthSquare, heightSquare); //0
  rect(x0, y2, widthSquare, heightSquare); //1
  rect(x1, y2, widthSquare, heightSquare); //2
  rect(x2, y2, widthSquare, heightSquare); //3
  rect(x0, y1, widthSquare, heightSquare); //4
  rect(x1, y1, widthSquare, heightSquare); //5
  rect(x2, y1, widthSquare, heightSquare); //6
  rect(x0, y0, widthSquare, heightSquare); //7
  rect(x1, y0, widthSquare, heightSquare); //8
  rect(x2, y0, widthSquare, heightSquare); //9
}

void draw() {
}

void mousePressed() {
  if (mousePressed && mouseX > x0 && mouseX < x1 && mouseY > y2 && mouseY < y3) println("1"); //1
    if (mousePressed && mouseX > x1 && mouseX < x2 && mouseY > y2 && mouseY < y3) println("2"); //2
      if (mousePressed && mouseX > x2 && mouseX < x3 && mouseY > y2 && mouseY < y3) println("3"); //3
        if (mousePressed && mouseX > x0 && mouseX < x1 && mouseY > y1 && mouseY < y2) println("4"); //4
          if (mousePressed && mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) println("5"); //5
            if (mousePressed && mouseX > x2 && mouseX < x3 && mouseY > y1 && mouseY < y2) println("6"); //6
              if (mousePressed && mouseX > x0 && mouseX < x1 && mouseY > y0 && mouseY < y1) println("7"); //7
                if (mousePressed && mouseX > x1 && mouseX < x2 && mouseY > y0 && mouseY < y1) println("8"); //8
                  if (mousePressed && mouseX > x2 && mouseX < x3 && mouseY > y0 && mouseY < y1) println("9"); //9
                    if (mousePressed && mouseX > x1 && mouseX < x2 && mouseY > y3 && mouseY < y4) println("0"); //0
}

void keyPressed() {
  if (keyPressed && key == 1) println("1");
}
