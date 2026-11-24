// Calm colour ripples for the ideas-page hero (2D, no WebGL needed).
// Adapted from "gotas_de_colores" in the author's Processing library: drops expand
// as rings and fade out. Here no click is needed: drops appear on their own, and
// drops follow the pointer when it moves across the banner.
//  - coordinates are CSS pixels; the canvas is drawn at device resolution (S = devicePixelRatio)
//  - palette and background taken from the events banner

float S = 1;                    // device pixel ratio
float LW = 1, LH = 1;           // logical size in CSS pixels
float maxR;                     // radius at which a ripple has faded out
int spawnTimer = 0;
ArrayList drops = new ArrayList();

color BG = color(14, 13, 11);
color[] PAL = {
  color(201, 169, 110),   // champagne
  color(246, 200, 150),   // apricot
  color(196, 108, 70),    // copper
  color(143, 184, 166),   // sage
  color(242, 237, 228)    // platinum
};

class Drop {
  float x, y, r, speed, alpha;
  color c;

  Drop(float x_, float y_, color c_) {
    x = x_;
    y = y_;
    c = c_;
    r = 0;
    speed = random(0.5, 0.9);
    alpha = 255;
  }

  void step() {
    r += speed;
    // the rings are brightest when small and dim steadily as they grow
    alpha = 255 * pow(1 - r / maxR, 1.5);
  }

  boolean alive() {
    return r < maxR;
  }

  void show() {
    if (alpha <= 0) return;
    noFill();
    // two thin rings per drop, the inner one softer, for a quieter look
    stroke(red(c), green(c), blue(c), alpha * 0.95);
    strokeWeight(1.8);
    ellipse(x, y, 2 * r, 2 * r);
    stroke(red(c), green(c), blue(c), alpha * 0.55);
    strokeWeight(1.1);
    ellipse(x, y, 2 * r * 0.62, 2 * r * 0.62);
  }
}

void setup() {
  S = externals.window.devicePixelRatio;
  LW = externals.canvas.clientWidth;
  LH = externals.canvas.clientHeight;
  size(int(LW * S), int(LH * S));
  maxR = max(LW, LH) * 0.42;
  background(BG);
}

color randomPal() {
  return PAL[int(random(PAL.length))];
}

void draw() {
  background(BG);
  pushMatrix();
  scale(S);

  // a new drop every second or so, at a random place
  spawnTimer++;
  if (spawnTimer > 60) {
    drops.add(new Drop(random(LW), random(LH), randomPal()));
    spawnTimer = 0;
  }

  // when the pointer moves over the banner, it leaves a drop every few frames
  if (mouseX >= 0 && mouseX <= LW && mouseY >= 0 && mouseY <= LH) {
    float moved = abs(mouseX - pmouseX) + abs(mouseY - pmouseY);
    if (moved > 4 && frameCount % 6 == 0) {
      drops.add(new Drop(mouseX, mouseY, randomPal()));
    }
  }

  // keep the field light: drop the oldest ripples first
  while (drops.size() > 70) {
    drops.remove(0);
  }

  // iterate backwards so removing a finished drop does not skip the next one
  for (int i = drops.size() - 1; i >= 0; i--) {
    Drop d = (Drop) drops.get(i);
    d.step();
    d.show();
    if (!d.alive()) {
      drops.remove(i);
    }
  }

  popMatrix();
}
