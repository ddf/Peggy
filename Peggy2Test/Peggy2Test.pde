#include <Peggy2Serial.h>

Peggy2 frame1;
Peggy2 frame2;
Peggy2 frame3;

void setup()
{
  frame1.HardwareInit();
  frame2.HardwareInit();
  frame3.HardwareInit();
  
}

float phaseX = 0.f;
float phaseStep =  PI / 32.0f;
float phaseY = 0.f;

float mod = 0.f;
float modStep = PI / 33.f;

void box( Peggy2 & frame, int x, int y, int w, int h )
{
  // top line
  frame.Line( x - w/2, y - h/2, x + w/2, y - h/2 );
  // left line
  frame.Line( x - w/2, y - h/2, x - w/2, y + h/2 );
  // right line
  frame.Line( x + w/2, y - h/2, x + w/2, y + h/2 );
  // bottom line
  frame.Line( x - w/2, y + h/2, x + w/2, y + h/2 );
}

void loop()
{
  frame1.Clear();
  frame2.Clear();
  frame3.Clear();
  
  float rx = sin( phaseX )*10.f + 12.f;
  float ry = cos( phaseY )*12.f + 14.f;
  
  box( frame1, 12, 12, rx, ry );
  box( frame1, 12, 12, rx*0.2, ry*0.2f );
  box( frame2, 12, 12, ry, rx );
  box( frame2, 12, 12, ry*0.4f, rx*0.4f );
  box( frame3, 12, 12, rx*0.5f, ry+0.5f );
  frame1.RefreshAll(2);
  frame2.RefreshAll(6);
  frame3.RefreshAll(10);
  
  phaseX += phaseStep + sin(mod) * 0.5f;
  if ( phaseX >= TWO_PI )
  {
    phaseX -= TWO_PI;
  }
  
  phaseY += phaseStep * 1.1f;
  if ( phaseY >= TWO_PI )
  {
    phaseY -= TWO_PI;
  }
  
  mod += modStep;
  if ( modStep >= TWO_PI )
  {
    modStep -= TWO_PI;
  }
}
