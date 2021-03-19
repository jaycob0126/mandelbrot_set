float scale = 0.8;  //<>//
float transX = 100;
float transY = 0;

float prev_mouseX = 0;
float prev_mouseY = 0;

float MAX_ITER = 100;

float initZ_real = 0;
float initZ_im = 0;

void setup() {
  size(800, 500);
}

void draw() {
  background(0);

  loadPixels();
  
  int pix_index;
  
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {

      pix_index = x + width*y;

      float[] c = {x, y};
      translateVect(c, -(width/2+transX), -(height/2+transY));
      scaleVect(c, 1./(width/4.*scale));

      ComplexNum z = new ComplexNum(initZ_real, initZ_im);
      //colorMode(HSB, 100);
      color col = color(0);
      int iteration = 0;

      while (true) {

        z.squared();
        z.add(c);

        float col_map = map(iteration, 0, 100, 0, 250);
        if (z.hasDiverged()) {
          col = color(col_map);
          break;
        } else if (iteration >= MAX_ITER) {
          col = color(250, 250, 250);
          break;
        }
        iteration++;
      }

      pixels[pix_index] = col;
    }
  }
  
  updatePixels();
}

void translateVect(float[] z, float transX, float transY) {
  z[0] += transX;
  z[1] += transY;
}

void scaleVect(float[] z, float scl) {
  z[0] *= scl;
  z[1] *= scl;
}

void mousePressed() {
  prev_mouseX = -transX + mouseX;
  prev_mouseY = -transY + mouseY;
}

void mouseDragged() {
  transX = mouseX - prev_mouseX;
  transY = mouseY - prev_mouseY;
}

void mouseWheel(MouseEvent event) {
  scale -= .5*event.getCount();
}
