Die[] dice =  new Die[30];
int score = 0;
float fby = 0;
float sy = 0;
int c = 0;

void setup() {
  size(600, 600);
  for (int i = 0; i < dice.length; i++) { 
    dice[i] = new Die(0, 0);
    score += dice[i].roll;
  }
}

void draw() {
  background(80,133,188);
  for (int i = 0; i < dice.length; i++) { 
    dice[i].gravity();
    dice[i].roll();
    dice[i].slow();
  }
  fby = fby + sy;                         
  sy = sy + 0.15;
  if (fby >= 550) {
    sy = (float)Math.random()-10;
    c++;
  }
  if (c > 6) {                            
    fill(255);
    textSize(30);
    text("Score: " + score, 220, 170);
  }
}

class Die {                              
  float ballX, ballY, speedX, speedY;
  int roll, count, slow;
  Die(int x, int y) {
    speedX = 0;
    speedY = 0;
    ballX = 250;
    ballY = 0;
    roll = (int)(Math.random()*6+1);
    count = 0;
    slow = 13;
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
      speedY = (float)(Math.random()*2)-slow; 
      speedX = random(-5, 5);
      count++;
    }
    }

   void roll() {                                         
      if (roll == 1) {
        fill(255);
        rect(ballX, ballY, 50, 50, 20);
        fill(0);
        ellipse(ballX+25, ballY+25, 10, 10);
      }
      if (roll == 2) {
        fill(255);
        rect(ballX, ballY, 50, 50, 20);
        fill(0);
        ellipse(ballX+13, ballY+13, 10, 10);
        ellipse(ballX+37, ballY+37, 10, 10);
      }
      if (roll == 3) {
        fill(255);
        rect(ballX, ballY, 50, 50, 20);
        fill(0);
        ellipse(ballX+13, ballY+13, 10, 10);
        ellipse(ballX+37, ballY+37, 10, 10);
        ellipse(ballX+25, ballY+25, 10, 10);
      }
      if (roll == 4) {
        fill(255);
        rect(ballX, ballY, 50, 50, 20);
        fill(0);
        ellipse(ballX+13, ballY+13, 10, 10);
        ellipse(ballX+37, ballY+13, 10, 10);
        ellipse(ballX+37, ballY+37, 10, 10);
        ellipse(ballX+13, ballY+37, 10, 10);
      }
      if (roll == 5) {
        fill(255);
        rect(ballX, ballY, 50, 50, 20);
        fill(0);
        ellipse(ballX+13, ballY+13, 10, 10);
        ellipse(ballX+37, ballY+13, 10, 10);
        ellipse(ballX+37, ballY+37, 10, 10);
        ellipse(ballX+13, ballY+37, 10, 10);
        ellipse(ballX+25, ballY+25, 10, 10);
      }
      if (roll == 6) {
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
    void slow(){
      if(count == 2)                      
        slow = 10;
      if(count == 3)
        slow = 9;
      if(count == 4)
        slow = 6;
      if(count == 5)
        slow = 5;
      if (count > 6) {                    
        speedY = 0;
        speedX = 0;
      }
    }
  }
