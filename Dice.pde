class Die {
  float ballX, ballY, speedX, speedY;
  int ro, count;
  Die(int x, int y) {
    speedX = 0;
    speedY = 0;
    ballX = 250;
    ballY = 0;
    ro = (int)(Math.random()*6+1);
    count = 0;
  }

  void gravity() {
    ballY = ballY + speedY;
    speedY = speedY + 0.15;
    ballX = ballX + speedX;
    if (ballX >= 550)
      speedX = -(speedX);
    if (ballX <=0)
      speedX = -(speedX);
    if (ballY >= 550) {
      speedY = (float)(Math.random()*3)-11;
      speedX = random(-5, 5);
      count++;
    }
  }

  void roll() {
    if (ro == 1) {
      fill(255);
      rect(ballX, ballY, 50, 50, 20);
      fill(0);
      ellipse(ballX+25, ballY+25, 10, 10);
    }
    if (ro == 2) {
      fill(255);
      rect(ballX, ballY, 50, 50, 20);
      fill(0);
      ellipse(ballX+13, ballY+13, 10, 10);
      ellipse(ballX+37, ballY+37, 10, 10);
    }
    if (ro == 3) {
      fill(255);
      rect(ballX, ballY, 50, 50, 20);
      fill(0);
      ellipse(ballX+13, ballY+13, 10, 10);
      ellipse(ballX+37, ballY+37, 10, 10);
      ellipse(ballX+25, ballY+25, 10, 10);
    }
    if (ro == 4) {
      fill(255);
      rect(ballX, ballY, 50, 50, 20);
      fill(0);
      ellipse(ballX+13, ballY+13, 10, 10);
      ellipse(ballX+37, ballY+13, 10, 10);
      ellipse(ballX+37, ballY+37, 10, 10);
      ellipse(ballX+13, ballY+37, 10, 10);
    }
    if (ro == 5) {
      fill(255);
      rect(ballX, ballY, 50, 50, 20);
      fill(0);
      ellipse(ballX+13, ballY+13, 10, 10);
      ellipse(ballX+37, ballY+13, 10, 10);
      ellipse(ballX+37, ballY+37, 10, 10);
      ellipse(ballX+13, ballY+37, 10, 10);
      ellipse(ballX+25, ballY+25, 10, 10);
    }
    if (ro == 6) {
      fill(255);
      rect(ballX, ballY, 50, 50, 20);
      fill(0);
      ellipse(ballX+13, ballY+10, 10, 10);
      ellipse(ballX+13, ballY+25, 10, 10);
      ellipse(ballX+13, ballY+40, 10, 10);
      ellipse(ballX+37, ballY+10, 10, 10);
      ellipse(ballX+37, ballY+25, 10, 10);
      ellipse(ballX+37, ballY+40, 10, 10);
    }
  }
  void counter() {
    if (count > 4) {
      speedY = 0;
      speedX = 0;
    }
    fill(255);
    textSize(30);
    text("Score: " + score, 30, 50);
  }

  void mousePressed() {
    redraw();
  }
}
Die[] dice =  new Die[30];

int score = 0;
void setup() {
  size(600, 600);
  for (int i = 0; i < dice.length; i++) {
    dice[i] = new Die(0, 0);

    score += dice[i].ro;
  }
}

void draw() {
  background(125);
  for (int i = 0; i < dice.length; i++) {
    dice[i].gravity();
    dice[i].roll();
    dice[i].counter();
  }
}
