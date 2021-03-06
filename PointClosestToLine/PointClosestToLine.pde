//declare vectors
PVector u = new PVector(0, 0);
PVector uParV = new PVector(0, 0);
PVector uPerpV = new PVector(0, 0);
PVector v = new PVector(0, 0);
PVector closestPt = new PVector(0, 0);

//Point 1
float x1;
float y1;

//Point 2
float x2;
float y2;

//Point 3
float x3;
float y3;


void setup() {
  size(1000, 700);
  x1= random(width);
  y1= random(height);
  x2= random(width);
  y2 = random(height);
}

void draw() {
  //wipe background
  background(255);
  //line from pt1 to pt2
  line (x1, y1, x2, y2);
  //set x3,y3 to Mouse
  x3 = mouseX;
  y3 = mouseY;

  //set u to disp between pt1 and pt3
  u.set(x3-x1, y3-y1);

  //set v to disp between pt1 and pt2
  v.set(x2-x1, y2-y1);
  //u parallel to v is (u dot v divided by mag squared of v) times v
  uParV = v.copy();
  uParV = uParV.mult(u.dot(v)/v.magSq());
  //u perp v is u - u parallel
  uPerpV = u.copy();
  uPerpV.sub(uParV);

  //set fill to red
  fill(255, 0, 0);
  //set closest
  closestPt.set(x3-uPerpV.x,y3-uPerpV.y);
  
  //check that the result is between the points...
  float d1 = dist(closestPt.x,closestPt.y,x1,y1);
  float d2 = dist(closestPt.x,closestPt.y,x2,y2);
  if (d1<v.mag()&&d2<v.mag()) {
    //draw an ellipse at the point on the line from pt 1 to pt2 closest to pt3
    ellipse(closestPt.x, closestPt.y, 10, 10);
  }
  
  //prints distance from pt3 to line
  println(uPerpV.mag());
}
