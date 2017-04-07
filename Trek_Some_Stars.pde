// Credit to my friend Meri for
// giving me inspiration for the title screen.

KoraCam camera;

Planet Earth;

PVector earthpos;

PShape Enterprise;
PShape box;

int rand;

boolean isSplash;

Planet[] planets = new Planet[50];

PImage texture; //<>//

PImage intro;

float rotX = 0;
float rotY = 0; //<>//
float x, y, z; //<>//
int q = 70;

float entpos = 0;

void setup() //<>//
{
    fullScreen(P3D); //<>//
        isSplash = true;
        intro = loadImage("TREK_SOME_STARS.jpg");
    noStroke(); //<>//
    noCursor();
    box = createShape(BOX, 50000);
    texture= loadImage("stars.jpg");
    box.setTexture(texture);
  camera = new KoraCam(this);
      for (int i = 0; i < 50; i = i+1)
        { //<>//
          String tex = "blue.jpg";
          int rand = (int)random(0, 17);
          if (rand == 0)
          {
            tex = "blue.png";
          }
          if (rand == 1)
          {
            tex = "bridges.jpg";
          }
          if (rand == 2)
          {
            tex = "orange.png";
          }
          
           if (rand == 3)
          {
            tex = "aqua.png";
          }
          
           if (rand == 4)
          {
            tex = "brown.png";
          }
          
          if (rand == 5)
          {
            tex = "earthlike.jpg";
          }
          
          if (rand == 6)
          {
            tex = "green.jpg";
          }
          
          if (rand == 7)
          {
            tex = "grey.jpg";
          }
          
          if (rand == 8)
          {
            tex = "mountains.jpg";
          }
          
          if (rand == 9)
          {
            tex = "cool.png";
          }
          
          if (rand == 10)
          {
            tex = "paleblue.png";
          }
          
          if (rand == 11)
          {
            tex = "purple.png";
          }
          
          if (rand == 12)
          {
            tex = "red.jpg";
          }
          
          if (rand == 13)
          {
            tex = "blue.png";
          }
          
          if (rand == 14)
          {
            tex = "blue.png";
          }
          
          if (rand == 15)
          {
            tex = "black.jpg";
          }
          
          if (rand == 16)
          {
            tex = "ice.jpg";
          }
          
          planets[i] = new Planet((int)random(70, 900), 
          new PVector(random(-14500, 14500), random(-14500, 14500), random(-14500, 14500)),
                                  0, PI/random(110,360), tex);
          //int _size, PVector _location, float _rotY, float _rotSpeed, String tex)
        } //<>//
  Enterprise = loadShape("ncc1701.obj"); //<>//
    intro.resize(width, height);
    Earth = new Planet(600, new PVector(-1500, 15000, 15000), 0, PI/180, "earth.jpg");
} //<>//

void draw()
{  
  if (isSplash == true)
  {
    image(intro, 0, 0);
  }
  else
  {
    background(0);
    pushMatrix();
    translate(Earth.location.x, Earth.location.y, Earth.location.z);
    rotateY(entpos);
    entpos += PI/180;
    rotateX(PI/2);
      pushMatrix();
      translate(1000, 0, 0);
      rotateY(PI);
      rotateX(PI);
      rotateZ(PI/2);
      shape(Enterprise);
      popMatrix();
    popMatrix();
    shape(box);
    
    for (int i = 0; i < 50; i = i+1)
    {
    planets[i].Render();
    }
    Earth.Render();
  } //<>//
}

void keyPressed()
{
  if(key == ' ') //<>//
      {
       q = 1;
       frustum(-100, 100, -56, 56, q, 50000);
      }
      if(key == 'b' && isSplash == true)
      {
       isSplash = false;
       frustum(-100, 100, -56, 56, q, 50000); 
      }
}

void keyReleased()
{
  if(key == ' ')
      {
       q = 70;
       frustum(-100, 100, -56, 56, q, 50000);
      }
}