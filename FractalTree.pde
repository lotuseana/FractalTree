private double fractionLength = .8; 
private int smallestBranch = 8; 
private double branchAngle = .5;  
public void setup() 
{   
  size(650,600);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(255,31,135);
  strokeWeight(3);
  line(300,600,300,380);
  drawBranches(300,380,100, 2*Math.PI -2*Math.PI/5, 2, 255, 31, 135);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle, float weight, int r, int g, int b) 
{   
  double angle1 = angle+branchAngle; 
  double angle2 = angle-branchAngle;
  branchLength*= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  stroke(r,g,b);
  strokeWeight(weight);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if (branchLength>smallestBranch){
    drawBranches(endX1,endY1,branchLength,angle1,weight/1.2,(int)(r/1.15),(int)(g*1.2),(int)(b*1.05));
    drawBranches(endX2,endY2,branchLength,angle2,weight/1.2,(int)(r*1.1),(int)(g*1.2),(int)(b*1.2));
    //28, 232, 48
  }
} 
