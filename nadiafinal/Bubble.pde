class Bubble {
  float x;
  float y;
  int diameter = int(random(10, 40));
  float scalar = 0.2;
  float angle = 0.0;
  float speed = 0.01;
  int age = 0;
  float strokew = diameter/10;
  float xv = -3+random(1, 5);
  float yv = -random(3);
  float maxYV = 1;

  Bubble(float xp, float yp) {
    x = xp;
    y = yp;
    // s = tempS;
    //diameter = tempDiameter;
  }

  void run() {
    move();
    display();
  }

  void move() {
    x = x + xv + sin(angle)*scalar;
    y += yv;
    angle += speed;
    age++;
    if (age > 500) pop();
  }

  void display() {
    ellipseMode(CENTER);

    noFill();
    stroke(255);
    strokeWeight(strokew*0.5);
    ellipse(x, y, diameter, diameter);
    strokeWeight(strokew*1.5);
    strokeCap(ROUND);
    arc(x, y, diameter-15, diameter-15, 5.65, 6.56);
    strokeWeight(strokew*1);
    arc(x, y, diameter-15, diameter-15, 0.79, 1.16);
  }

  void pop() {
    bubbles.remove(this);
  }
}
