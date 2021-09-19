class Star {
  
  float x;
  float y;
  float z;
  float pz;

  Star() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
  }

  void update() {
  z = z - speed;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    //fill(204, 102, 0); //orange 
    fill(225);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;
    float r = map(z, 0, width/2, 16, 0); 

    //pushMatrix();
    //translate(width*0.8, height*0.5);
    //rotate(frameCount / -100.0);
    //polygon(sx, sy, 60, 6);  // Heptagon
    //popMatrix();
  
    ellipse(sx, sy, r, r);
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);
    pz = z;
    stroke(255);
    line(px, py, sx, sy);

  }
  void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
