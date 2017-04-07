class Planet
{
  PVector location;
  PShape sphere;
  PImage texture;
  float size;
  float rotY;
  float rotSpeed;
  
  Planet() //<>//
  {
    location = new PVector(width/2, height/2, 0);
    size = 150;
    sphere = createShape(SPHERE, size);
    texture = loadImage("brown.png");
    sphere.setTexture(texture);
    rotY=0;
    rotSpeed = PI/random(100, 360);
  }
  
  Planet(int _size, PVector _location, float _rotY, float _rotSpeed, String tex)
  {
    size = _size;
    sphere = createShape(SPHERE, size);
    texture = loadImage(tex);
    sphere.setTexture(texture);
    location = _location;
    rotY = _rotY;
    rotSpeed = _rotSpeed;
  }
  
  void Render() //<>//
  //push translate rotate xyz render pop
  {
    pushMatrix(); 
    translate(location.x, location.y, location.z);
    rotateY(rotY);
    shape(sphere);
    popMatrix();
    rotY += rotSpeed;
  }
   
} //<>//