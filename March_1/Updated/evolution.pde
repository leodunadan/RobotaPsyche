





//Leo El-azhab
//Assignemt 2 - Force Field
//This is the code that didn't work

// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;


PImage fish;

void setup() {
  size(800, 600);
  // Make a new flow field with resolution of the number in the bracket
  flowfield = new FlowField(20);
  vehicles = new ArrayList<Vehicle>();
  // Make a bunch of vehicles with random maxspeed and maxforce values
  for (int i = 0; i < 120; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
    
  fish = loadImage("fish.png");   //loads the image called fish
  }
}

void draw() {
  background(255);
  
  
  
  //flowfield.display();
  
  for (Vehicle v : vehicles) {
   v.follow(flowfield);
   v.RunAway();
   v.run();
   

  }
}
