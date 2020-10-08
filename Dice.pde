int[] numberCount = {0, 0, 0, 0, 0, 0};
int[] nums = new int[36];
int initialX = 25;
int initialY = 25;
int maximum;
int maxNum = 1;//the place in numberCount where maximum is set to
void setup()
{
  noLoop();
  frameRate(10);
  size(685, 475);
  textSize(20);
}
void draw()
{
  background(50);
  maximum = numberCount[0];
  //grid of die
  for (int y = 20; y <= 395; y += 75) {
    for (int x = 20; x<= 395; x += 75) {
      Die d = new Die(x, y);
      d.roll();
      d.show();
    }
  }
  //finding maximum
  for (int i = 0; i < 6; i++) {
    if (numberCount[i] >= maximum) {
      maximum = numberCount[i];
      maxNum = i + 1;
    }
  }
  //chart
  fill(255, 50, 50);
  rect(475, 20 + (200 - 200 * numberCount[0]/maximum), 30, 200 * numberCount[0]/maximum);
  fill(255, 177, 50);
  rect(505, 20 + (200 - 200 * numberCount[1]/maximum), 30, 200 * numberCount[1]/maximum);
  fill(255, 255, 50);
  rect(535, 20 + (200 - 200 * numberCount[2]/maximum), 30, 200 * numberCount[2]/maximum);
  fill(50, 255, 50);
  rect(565, 20 + (200 - 200 * numberCount[3]/maximum), 30, 200 * numberCount[3]/maximum);
  fill(50, 50, 255);
  rect(595, 20 + (200 - 200 * numberCount[4]/maximum), 30, 200 * numberCount[4]/maximum);
  fill(189, 50, 255);
  rect(625, 20 + (200 - 200 * numberCount[5]/maximum), 30, 200 * numberCount[5]/maximum);
  fill(255,255,255);
  //text display
  text("1's: " + numberCount[0], 475, 250);
  text("2's: " + numberCount[1], 475, 275);
  text("3's: " + numberCount[2], 475, 300);
  text("4's: " + numberCount[3], 475, 325);
  text("5's: " + numberCount[4], 475, 350);
  text("6's: " + numberCount[5], 475, 375);
  //average
  float sum = (float)(numberCount[0] * 1 + numberCount[1] * 2 + numberCount[2] * 3 + numberCount[3] * 4 + numberCount[4] * 5 + numberCount[5] * 6);
  float averageNum = sum/36;
  String average = String.format("%.2f", averageNum);
  text("Average: " +  average, 540, 250);
  //mode
  text("Mode: " + maxNum, 540, 275);
  //total
  text("Total: " + sum, 540, 300);
}

void mousePressed()
{
  numberCount[0] = 0;
  numberCount[1] = 0;
  numberCount[2] = 0;
  numberCount[3] = 0;
  numberCount[4] = 0;
  numberCount[5] = 0;
  redraw();
}
class Die //models one single dice cube
{
  int myX;
  int myY;
  int num;//member variable declarations here

  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;//variable initializations here
  }
  void roll()
  {
    num = (int)(Math.random() * 6) + 1;//your code here
    
  }
  void show()
  {
    //each if statement adds to the number count and describes how the dice looks
    if (num == 1) {
      numberCount[0] += 1;
      fill(255);
      stroke(0);
      rect(myX, myY, 50, 50, 5);
      noStroke();
      fill(0);
      ellipse(myX + 25, myY + 25, 10, 10); //centre dot
    } else if (num == 2) {
      numberCount[1] += 1;
      fill(255);
      stroke(0);
      rect(myX, myY, 50, 50, 5);
      noStroke();
      fill(0);
      ellipse(myX + 37.5, myY + 12.5, 10, 10); //top right
      ellipse(myX + 12.5, myY + 37.5, 10, 10); //bottom left
    } else if (num == 3) {
      numberCount[2] += 1;
      fill(255);
      stroke(0);
      rect(myX, myY, 50, 50, 5);
      noStroke();
      fill(0);
      ellipse(myX + 37.5, myY + 12.5, 10, 10); //top right
      ellipse(myX + 25, myY + 25, 10, 10); //centre dot
      ellipse(myX + 12.5, myY + 37.5, 10, 10); //bottom left
    } else if (num == 4) {
      numberCount[3] += 1;
      fill(255);
      stroke(0);
      rect(myX, myY, 50, 50, 5);
      noStroke();
      fill(0);
      ellipse(myX + 12.5, myY + 12.5, 10, 10); //top left
      ellipse(myX + 37.5, myY + 12.5, 10, 10); //top right
      ellipse(myX + 12.5, myY + 37.5, 10, 10); //bottom left
      ellipse(myX + 37.5, myY + 37.5, 10, 10); //bottom right
    } else if (num == 5) {
      numberCount[4] += 1;
      fill(255);
      stroke(0);
      rect(myX, myY, 50, 50, 5);
      noStroke();
      fill(0);
      ellipse(myX + 12.5, myY + 12.5, 10, 10); //top left
      ellipse(myX + 37.5, myY + 12.5, 10, 10); //top right
      ellipse(myX + 25, myY + 25, 10, 10); //centre dot
      ellipse(myX + 12.5, myY + 37.5, 10, 10); //bottom left
      ellipse(myX + 37.5, myY + 37.5, 10, 10); //bottom right
    } else if (num == 6) {
      numberCount[5] += 1;
      fill(255);
      stroke(0);
      rect(myX, myY, 50, 50, 5);
      noStroke();
      fill(0);
      ellipse(myX + 12.5, myY + 12.5, 10, 10); //top left
      ellipse(myX + 37.5, myY + 12.5, 10, 10); //top bottom
      ellipse(myX + 12.5, myY + 25, 10, 10); //left centre
      ellipse(myX + 37.5, myY + 25, 10, 10); //left centre
      ellipse(myX + 12.5, myY + 37.5, 10, 10); //bottom left
      ellipse(myX + 37.5, myY + 37.5, 10, 10); //bottom right
    }
  }
}
