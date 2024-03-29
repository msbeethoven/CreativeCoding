// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float gravity = 0.1;
  float xSpeed = 0;
  float ySpeed = 0;

  Mover(float m, float x , float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void draw(){
   if ( mouseX-pmouseX > 0 ) {
    xSpeed = abs(mouseX-pmouseX);
  } else {
    xSpeed = -abs(mouseX-pmouseX);
  }
   
  if ( mouseY-pmouseY > 0 ) {
    ySpeed = abs(mouseY-pmouseY);
  } else {
    ySpeed = -abs(mouseY-pmouseY);
  }
  println(xSpeed);
  
   for (int i=0; i < movers.length; i++) {
    movers[i].gravity();
    movers[i].move();
    movers[i].display();
  }
  
  }
  

  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0,127);
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }

  }

}



