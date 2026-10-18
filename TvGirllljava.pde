PImage bg;
color[] colArray = {
  color(204,0,102),
  color(26,44,117),
  color(255,105,180)
};

int maxStamps = 300;            
float[] px = new float[maxStamps]; 
float[] py = new float[maxStamps]; 
int count = 0;                  

float lastX = -1000; 
float lastY = -1000; 
float spacing = 60;           

void setup(){
  size(600, 560);
  noFill();
  bg = loadImage("TvGirlll.png");
  strokeWeight(3);
  frameRate(20);
}

void draw(){
  background(bg);


  if (dist(mouseX, mouseY, lastX, lastY) > spacing && count < maxStamps) {
    px[count] = mouseX;
    py[count] = mouseY;
    count++;
    lastX = mouseX;
    lastY = mouseY;
  }

  
  float rnumber = 60;
  for (int i = 0; i < count; i++) {
    stroke(colArray[(int)random(3)]);

    for (int num = 0; num < 3; num++) {
      float x1 = random(rnumber);
      float y1 = random(rnumber);
      float x2 = random(rnumber);
      float y2 = random(rnumber);
      float x3 = random(rnumber);
      float y3 = random(rnumber);
      float x4 = random(rnumber);
      float y4 = random(rnumber);

      pushMatrix();
      translate(px[i], py[i]);
      quad(x1, y1, x2, y2, x3, y3, x4, y4);
      popMatrix();
    }
  }
}
