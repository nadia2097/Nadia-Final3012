// mode 1 is the start screen
// mode 2 is the about page
// mode 3 is the actual work itself
import processing.video.*;
int mode = 1;
// 0 is false;
boolean buttonClicked = false;
float back;
Star[] starList = new Star[50]; 
PImage img;
float circleX;
int pointillize = 20;
bubbleSystem bs = new bubbleSystem();
ArrayList  bubbles = new ArrayList();
Movie video;

void setup() {
  size(1000, 800);
  img = loadImage("p3bg.png");
  video = new Movie(this, "titlemp4.mp4");
  video.play();
  for (int i = 0; i < starList.length; i ++ ) {
    starList[i] = new Star(color(i*30 % width, 255, 255, 255), i*30 + 10, 100, random(1, 2), random(1, 2));
  }
}

void draw() {

  // Title Screen
  if (mode == 1) {
    background(loadImage("final-bg.png"));
    // This is where all the title screen stuff happens
    textSize(20);
    text("Digital Art Gallery", width/2-100, height/2-30);
    text("hit ↓ to read an artist statement", width/2-165, height/2-0);
  }
  // About page
  else if (mode == 2) {
    background(loadImage("final-bg.png"));
    fill(255, 255, 255);
    textSize(15);
    text("I like to draw. It’s been a hobby of mine since I was a kid.", width/50, height/2-225);
    text("I remember starting off tracing pictures of Squidward and neopets.", width/50, height/2-200);
    text("In middle school a friend introduced me to anime. Now I’m not", width/50, height/2-175);
    text("into that stuff anymore but it definitely influenced my artstyle a lot.", width/50, height/2-150);
    text("Eventually I moved onto drawing all digitally. I was met with both praise and criticism", width/50, height/2-100);
    text("but I remember the one thing that used to make me most self conscious was the fact that", width/50, height/2-75);
    text("people would often say “oh it’s anime.” Not even western cartoony styles were met with", width/50, height/2-50);
    text("the same snarky tone.", width/50, height/2-25);
    text("So I wanted to show that yes, styles that happen to look like anime can be beautiful too.", width/50, height/2+25);
    text("And that there are benefits to digital art,", width/50, height/2+50);
    text("things that you can do better using digital art as opposed to traditional art.", width/50, height/2+75);
    text("The world is changing and people could stand to have a more open mind.", width/50, height/2+125);
    textSize(20);
    text("hit → to enter", width/50, height/2+175);
    text("hit ← to return to title at any time", width/50, height/2+200);


    // This is where all the about page stuff like the
    // text or even an image of the creator
  }
  // GALLERY VIDEO
  else if (mode == 3) {
    background(29, 35, 47);
    image(video, 0, 0);

    //PIECE 1
  } else if (mode == 4) {
    img = loadImage("p1bg.png");
    // Pick a random point
    int x = int(random(img.width));
    int y = int(random(img.height));
    int loc = x + y*img.width;

    // Look up the RGB color in the source image
    loadPixels();
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    noStroke();

    // Draw an ellipse at that location with that color
    fill(r, g, b, 100);
    rect(x, y, pointillize/2, pointillize/2);

    //PIECE 2
  } else if (mode == 5) {
    background(loadImage("p2Bg2.png"));
    if (mousePressed) {
      bs.add(new Bubble(mouseX, mouseY));
    }
    bs.blow();

    //PIECE 3
  } else if (mode == 6) {
    background(29, 35, 47);
    image(img, 0, 0);
    circleX = circleX + 1;


    if (circleX >= width) {
      circleX = 0;
    }

    for (int i = 0; i < starList.length-1; i ++ ) {
      starList[i].move(); 
      starList[i].display();
      starList[i].bounce();

      //lights
      fill(251, 248, 212);
      ellipse(10*2, circleX*2, 10*2, 10*2);
      ellipse(50*2, circleX+20*2, 10*2, 10*2);
      ellipse(80*2, circleX*2, 5*2, 5*2);
      ellipse(110*2, circleX+100*2, 5*2, 5*2);
      ellipse(140*2, circleX+150*2, 10*2, 10*2);
      ellipse(180*2, circleX-200*2, 10*2, 10*2);
      ellipse(200*2, circleX-150*2, 5*2, 5*2);
      ellipse(240*2, circleX-50*2, 5*2, 5*2);
      ellipse(240*2, circleX*2, 10*2, 10*2);
      ellipse(300*2, circleX+20*2, 5*2, 5*2);
      ellipse(440*2, circleX*2, 10*2, 10*2);
      ellipse(440*2, circleX*2, 10*2, 10*2);
      ellipse(550*2, circleX+100*2, 10*2, 10*2);
      ellipse(530*2, circleX-250*2, 10*2, 10*2);
      ellipse(530*2, circleX-200*2, 5*2, 5*2);
      ellipse(580*2, circleX-300*2, 5*2, 5*2);
      ellipse(300*2, circleX-400*2, 5*2, 5*2);
      ellipse(140*2, circleX-350*2, 5*2, 5*2);
      ellipse(400*2, circleX-300*2, 5*2, 5*2);
      ellipse(550*2, circleX*2, 5*2, 5*2);
    }
  } else if (mode == 7) {
    background(loadImage("gallstatic.png"));
  }
}

void movieEvent(Movie video) {
  video.read();
} 

void mousePressed() {
  if (mouseX > 10 && mouseX < width &&
    mouseY > 10 && mouseY < height) {

    buttonClicked = !buttonClicked;
  }
}

void mouseMoved() {
  if (mouseX>img.width/3000 && mode == 4) {
    int x = mouseX;
    int y = mouseY;
    int loc = x + y*img.width;

    loadPixels();
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    noStroke();

    fill(r, g, b, 100);
    rect(x, y, pointillize*2, pointillize*2);
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    mode = 1;
  } else if (keyCode == DOWN) {
    mode = 2;
  } else if (keyCode == RIGHT) {
    mode = 3;
  } else if (key == '1') {
    clear();
    mode = 4;
  } else if (key == '2') {
    mode = 5;
  } else if (key == '3') {
    mode = 6;
  } else if (key == ' ' ) {
    mode = 7;
  }
}
