PVector u = new PVector(0,0);
PVector uParV = new PVector(0,0);
PVector uPerpV = new PVector(0,0);
PVector v = new PVector(0,0);

//Point 1
float x1=0;
float y1=0;

//Point 2
float x2= width/2;
float y2 = height/2;

//Point 3
float x3;
float y3;


void setup(){
  size(1000,700);
  x2= width;
  y2 = height;
}

void draw(){
  background(255);
  x3 = mouseX;
  y3 = mouseY;
  u.set(x3-x1,y3-y1);
  v.set(x2-x1,y2-y1);
  uParV = v.copy();
  uParV = uParV.mult(u.dot(v)/v.magSq());
  uPerpV = u.copy();
  uPerpV.sub(uParV);
  fill(255,0,0);
  ellipse(x3-uPerpV.x,y3-uPerpV.y,10,10);
}
