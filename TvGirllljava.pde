PImage bg;
color[] colArray = {
  color(204,0,102),
  color(26,44,117),
  color(255,105,180)
};

int maxStamps = 300;            // quantidade maxima de quads que pode ser colocado
float[] px = new float[maxStamps]; // memoria da posiçao X
float[] py = new float[maxStamps]; // memoria da posiçao Y
int count = 0;                  // quantidade de quads colocados

float lastX = -1000; // lembra da ultima posiçao do teu quad pra o X
float lastY = -1000; // lembra da ultima posiçao do teu quad pra o Y
float spacing = 60;             // o quao longe o mouse tem que se mover para colocar o proximo quad

void setup(){
  size(600, 560);
  noFill();
  bg = loadImage("TvGirlll.png");
  strokeWeight(3);
  frameRate(20);
}

void draw(){
  background(bg);

  // coloca um novo quad se o mouse moveu o suficiente 
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
