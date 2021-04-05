PVector p1, p2, p3, b, v, vm;
  
  p1 = new PVector(0, 0);
  p2 = new PVector(0, 10);
  p3 = new PVector(25, 5);
  v = PVector.sub(p3, p1);
  b = PVector.sub(p1, p2);
  b.normalize();
  vm = b.mult(v.dot(b));
  
  println (vm);
