//Leo El-azhab
//February 8th - Assignemt 1
//This is a rocket that is moved by arrow keys 


Mover mover;
PImage rocket;
float rocketX, rocketY;
float change = 10.5;
int rocketSize = 100;

void setup() {
  size(800, 500);
  mover = new Mover();
  rocket = loadImage("rocket.png");   //loads the image called rocket
}

PVector direction = new PVector(0, 0);

void draw() {
  background(250);

  mover.update();
  mover.checkEdges();
  mover.display();
 }

void drawRocket() { //creates the rocket
  imageMode(CENTER);
  image(rocket, rocketX, rocketY, rocketSize, rocketSize);
 }



class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;


  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.0, 0.0);
    topspeed = 2; // chnages the spead of the rocket
  }

  void update() {

    PVector k_read = new PVector(0.0, 0.0);
    key_move(k_read);

    acceleration.add(k_read);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    println("velocity     : " + velocity);
    println("acceleration : " + acceleration);
    acceleration.mult(0);
  }

  void display() {
    float theta = velocity.heading2D() + radians(90);

    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(theta); // should change the orientation of the rocket
    drawRocket();
    popMatrix();
  }

  void key_move(PVector k_r) {

    if (keyCode == LEFT) {
      velocity.x = 0;
      k_r.x = -change;
    }
    if (keyCode == RIGHT) {
      velocity.x = 0;
      k_r.x = change;
    }
    if (keyCode == UP) {
      velocity.y = 0;
      k_r.y = -change;
    }
    if (keyCode == DOWN) {
      velocity.y = 0;
      k_r.y = change;
    }
    if (keyCode == ALT) {
      velocity.mult(0);
    }
  }

  void checkEdges() {  //takes the rocket to the other side of the window

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
