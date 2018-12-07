class Star { 
  // Variables.
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  //constructor.
  Star(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }

  //Function.
  void display() {
    fill (c);
    rectMode(CENTER);
    noStroke();
    pushMatrix();
    translate (xpos, ypos); 
    beginShape();
    vertex(0*0.1, -50*0.1);
    vertex(14*0.1, -20*0.1);
    vertex(47*0.1, -15*0.1);
    vertex(23*0.1, 7*0.1);
    vertex(29*0.1, 40*0.1);
    vertex(0*0.1, 25*0.1);
    vertex(-29*0.1, 40*0.1);
    vertex(-23*0.1, 7*0.1);
    vertex(-47*0.1, -15*0.1);
    vertex(-14*0.1, -20*0.1);
    endShape(CLOSE);
    popMatrix();
  }

  void bounce() {
    // If we’ve reached an edge, reverse speed
    if ((ypos > height - 10) || (ypos < 10)) {
      yspeed = yspeed * - 1;
    }

    if ((xpos > width - 10) || (xpos < 10)) {
      xspeed = xspeed * - 1;
    }
  }

  // Function.  
  void move() { 
    ypos = ypos + yspeed;
    xpos = xpos + xspeed;
  }
}
