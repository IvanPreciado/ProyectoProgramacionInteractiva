import oscP5.*;
import netP5.*;

OscP5 oscP5;

NetAddress direccionRemota;

float secuencia=1;
int red=255, g=0, b=0;

void setup() {
   size(600,600);
   oscP5 = new OscP5(this, 12000);
   direccionRemota = new NetAddress("127.0.0.1", 12001);
}
 
  void draw() {
   println(secuencia);
   background(0);
   translate(width*0.5, height*0.5);
   stroke(0);
   float angle = PI*(3.0-sqrt(5.0)); //137.5 in radians
   float r, theta, x, y;
   int n = 250;
  
   for (int i=1; i < n; i=i+1) {
      r = i;
      theta = i * angle * secuencia;
      // Convert polar to cartesian
      x = r * cos(theta);
      y = r * sin(theta);
        fill(red,g,b);
        ellipse(x, y, 10, 10);
      }
   }
   

void oscEvent(OscMessage theOscMessage){
  if (theOscMessage.checkAddrPattern("/x") == true){
    secuencia = theOscMessage.get(0).intValue();
    }
  if (theOscMessage.checkAddrPattern("/red") == true){
  red = theOscMessage.get(0).intValue();
    }
  if (theOscMessage.checkAddrPattern("/g") == true){
  g = theOscMessage.get(0).intValue();
    }  
  if (theOscMessage.checkAddrPattern("/b") == true){
  b = theOscMessage.get(0).intValue();
    }    
  }

/* 255,0,0
255,127,0
255,255,0
0,255,0
0,0,255
75,0,130
255,0,255 */
