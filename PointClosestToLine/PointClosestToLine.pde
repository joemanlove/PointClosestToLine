//declare vectors
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
  //wipe background
  background(255);
  //set x3,y3 to Mouse
  x3 = mouseX;
  y3 = mouseY;
  
  //set u to disp between pt1 and pt3
  u.set(x3-x1,y3-y1);
  
 //set v to disp between pt1 and pt2
  v.set(x2-x1,y2-y1);
  //u parallel to v is (u dot v divided by mag squared of v) times v
  uParV = v.copy();
  uParV = uParV.mult(u.dot(v)/v.magSq());
  //u perp v is u - u parallel
  uPerpV = u.copy();
  uPerpV.sub(uParV);
  
  //set fill to red
  fill(255,0,0);
  //draw an ellipse at the point on the line from pt 1 to pt2 closest to pt3
  ellipse(x3-uPerpV.x,y3-uPerpV.y,10,10);
}
