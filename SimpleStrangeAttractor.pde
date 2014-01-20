// SimpleStrangeAttractor.pde - Nathan Selikoff, Jan 2014
// http://nathanselikoff.com/training
// http://awakeningstudios.com

// Simple realtime 2d strange attractor example
// Many further optimizations are available, to get up to 1 million+ particles,
// but it's good to start simple and understand the algorithm before adding complexity

int numPoints = 20000;

float  x = 0.1, y = 0.1,    // starting point
  a = -0.966918,            // coefficients for "The King's Dream"
  b = 2.879879,
  c = 0.765145,
  d = 0.744728;
  
void setup() {
  size(600, 600, P3D);
  frameRate(30);
  stroke(255, 128);
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  scale(150.0);
  
  for (int i = 0; i < numPoints; i++) {
    PVector newPoint = getPoint();
    point(newPoint.x, newPoint.y);
  }
  
}

PVector getPoint() {
  
  float xn, yn;
  
  xn = sin(y*(float)b) - c*sin(x*(float)b);
  yn = sin(x*(float)a) - d*sin(y*(float)a);
      
  x = xn;
  y = yn;
  
  // sometimes jitter can help keep things from collapsing due to floating point rounding errors
  a += 0.000000005;
  
  return new PVector(xn, yn);
}

