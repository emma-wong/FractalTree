private double fractionLength = .8; 
private int smallestBranch = 3; 
private double branchAngle = .45;  
int rColor = 0;
int gColor = 0;
int bColor = 255;
public void setup() 
{   
	size(640,480);    
} 
public void draw() 
{   
	background(0);   
	stroke(rColor, gColor, bColor);   
	line(320,480,320,380);   
	drawBranches(320,380,460-mouseY,3*Math.PI/2);
} 

public void mouseClicked()
{
	rColor = (int)random(0, 255);
	gColor = (int)random(0, 255);
	bColor = (int)random(0, 255);
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);  
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);  
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);  		  	
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if (branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength/1.35, angle1);
		drawBranches(endX2, endY2, branchLength/1.35, angle2);
	}
} 
