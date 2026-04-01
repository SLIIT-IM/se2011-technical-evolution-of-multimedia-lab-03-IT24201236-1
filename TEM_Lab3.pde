// Interactive Animated Toy

float starX;        
float starY;        
float starSpeed = 3; 


float collectorSize = 60; 


int score = 0;      
PFont font;         

void setup() {
  size(600, 500);   
  
  starX = random(width);
  starY = 0;
  
 
  font = createFont("Arial", 24, true);
}

void draw() {
  
  
  background(150, 120, 255);
  

  float collectorX = mouseX;

  collectorX = constrain(collectorX, collectorSize/2, width - collectorSize/2);
 
  fill(60, 30, 255); 
  noStroke();
  ellipse(collectorX, height - 30, collectorSize, 30); 
  
  //  highlighting the collector for better visual feedback
  fill(150, 220, 255);
  ellipse(collectorX, height - 33, collectorSize-10, 15);
  

  fill(255, 255, 50); 
  ellipse(starX, starY, 30, 30);
  
 
  
  starY = starY + starSpeed;
  
  
  if (starY + 15 > height - 45 && starY - 15 < height - 15 && 
      starX + 15 > collectorX - collectorSize/2 && starX - 15 < collectorX + collectorSize/2) {
    
   
    starY = 0;
    starX = random(width);
    score++; 
  }
  
  
  if (starY > height + 30) {
    starY = 0;
    starX = random(width);
   
  }
  
  
  textFont(font);
  fill(80);
  textAlign(CENTER);
  text("Score: " + score, width/2, 40);
  
  //  instruction for the user
  fill(255);
  textSize(12);
  text("Move the blue paddle with your mouse to catch the ball!", width/2, height - 15);
}
