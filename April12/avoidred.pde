// Now look at each vehicle and if it is red calculate the desired vector to avoid it
    for (Vehicle other : vehicles) {

      // What is the distance between me and another Vehicle?
      float d = PVector.dist(location, other.location);

      // If the distance is zero we are looking at ourselves so skip over ourselves
      if (d == 0) {
        continue;
      }

      // If the distance is greater than tooClose skip this vehicle
      if (d > tooClose) {
        continue;
      }

      // Is other red?
      
      boolean otherIsRed = other.getIsRed(); // comparing to see if its red 

      // If so, avoid it, using the same logic as in separate
      if (otherIsRed) {

        //println(); // so messages are seaparated
        // Get the location of this vehicle relative to us
        PVector diff = PVector.sub(location, other.location); 

        // println("I am " + serialNumber + " other is aggressive; will avoid; diff = " + diff);

        diff.normalize(); 
        diff.div(d); // the closer it is the stronger desire it has to flee
        // println("after div, diff = " + diff);
        // We'll need the average, so add this location to the sum
        // of all locations and increment the count.
        sum.add(diff);
        int count++; // adds to the number of red vehicles we met
        
      }
    }

    // We have checked all vehicles and have a sum total of all the avoidance vectors
    if (count > 0) { // zero means we have not met any red vehicles 
      sum.div(count); // sum is now our desired velocity
      sum.normalize();
      // Scale desired velocity to maxspeed
      sum.mult(maxspeed); // so it runs away faster

      // Apply Reynolds’s steering formula:
     
      PVector steer = PVector.sub(sum, velocity);
      //println("I am " + serialNumber +  " sum = " + sum + " my v = " + velocity + " steer = " + steer);

      steer.limit(maxforce);

      // Apply the force to the Vehicle’s
      // acceleration.
      applyForce(applyLimits(steer));
    }
  }
