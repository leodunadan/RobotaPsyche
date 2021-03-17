


//void setup() {
//  fish = loadImage("fish.png");   //loads the image called fish
//}

class Vehicle {

  // The usual stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  float runningSpeed = maxspeed*10;

  float fishX, fishY;
  float change = 10.5;
  int fishSize = 2;

  int CurrentDistance;
  float CurrentFearMain;
  float CurrentFear1;
  float CurrentFear2; //this is how much the fish is afraid at the moment
  float ThresholdFear;

  PVector RunAway;



  Vehicle (PVector l, float ms, float mf) {
    location = l.get();
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }




  public void run() {
    update();
    borders();
    display();
  }


  void RunAway() {
    // current fear depends on the fish's proximity to the wall at any diven moment. S0 it should constantly compare the location of the fish to the walls.
    PVector running;
    
    if (location.x < width/2) {
      CurrentFear1 = map(location.x, 0, width/2, 100, 0); // the canvas is 800 wide so i want to translate this into a value between 0 and 100 to half the canvas
      // this translates start of canvas to middle as 100 to 0
    } else {
      CurrentFear1 = map(location.x, width/2, width, 0, 100); // this translates middle of canvas to end as 0 to 100
    }

    if (location.y < height/2) {
      CurrentFear2 = map(location.y, 0, height/2, 100, 0);
    } else {
      CurrentFear2 = map(location.y, height/2, height, 0, 100);
    }


    // this is where we set what runaway does- compare current fear to threshold fear
    if (CurrentFear1 > ThresholdFear) {
      if (location.x > width/2) { //fish is closer to the right wall so it has to run to the left
        // we are trying to find an appropriate PVector to avoid the wall - some sort of force that guides the fish when it reaches threshold fear
        // when a fish runs into a wall it would run into the opposite direction, so if its the right wall the fish will simply run to the left
        running = new PVector( -1, 0 );
      } else {
        running = new PVector( 1, 0 );
      }
    }
    
    if (CurrentFear2 > ThresholdFear) { // i made 2 different fears because i realised that if i average them out the average will make it move from both walls even if the fear onky comes from one
      if (location.y > height/2) { //fish is closer to the right wall so it has to run to the left
        // we are trying to find an appropriate PVector to avoid the wall - some sort of force that guides the fish when it reaches threshold fear
        // when a fish runs into a wall it would run into the opposite direction, so if its the right wall the fish will simply run to the left
        running = new PVector( 0, -1 );
      } else {
        running = new PVector( 0, 1 );
      }
    }
      
      
      println(running);


      // Scale it up to be the running speed of the fish
      running.mult(runningSpeed);
      // Steering is desired minus velocity
      PVector steer = PVector.sub(running, velocity);
      steer.limit(100);  // Limit to maximum steering force
      applyForce(steer);
    }
  }

  // Implementing Reynolds' flow field following algorithm
  // http://www.red3d.com/cwr/steer/FlowFollow.html
  void follow(FlowField flow) { 
    // What is the vector at that spot in the flow field?
    PVector desired = flow.lookup(location);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  void display() {

    if (CurrentFear < 99) { // i want fish that is too afraid to die (perhaps out of shock) so that only fish with fear less than a certain value is displayed
      float theta = velocity.heading2D() + radians(90);

      pushMatrix();
      rectMode(CENTER);
      translate(location.x, location.y);
      rotate(theta); // should change the orientation of the fish
      imageMode(CENTER);
      image(fish, 0, 0, 25, 25);
      popMatrix();
    }
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}
