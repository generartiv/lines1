float angleEffaceRouge = random(TWO_PI);
float ajoutAngleEffaceRouge;

float angleEffaceVert = random(TWO_PI);
float ajoutAngleEffaceVert;

float angleEffaceBleu = random(TWO_PI);
float ajoutAngleEffaceBleu;


float rLine, gLine, bLine;
float pointRefX, pointRefY, point1X, point1Y, point2X, point2Y;

float angleRotationGlobale = random(TWO_PI);
float ajoutAngleRotationGlobale;

float angleTailleGlobale = random(TWO_PI);
float ajoutAngleTailleGlobale;

float angleRotationLines = random(TWO_PI);
float ajoutAngleRotationLines;

float angleLenLinesX1 = random(TWO_PI);
float angleLenLinesY1 = random(TWO_PI);
float angleLenLinesX2 = random(TWO_PI);
float angleLenLinesY2 = random(TWO_PI);

float ajoutAngleLenLinesX1;
float ajoutAngleLenLinesY1;
float ajoutAngleLenLinesX2;
float ajoutAngleLenLinesY2;

float lenLineX1, lenLineY1, lenLineX2, lenLineY2;
/* -------------------------------------------------
 *   _____ ______ _______ _    _ _____  
 *  / ____|  ____|__   __| |  | |  __ \ 
 * | (___ | |__     | |  | |  | | |__) |
 *  \___ \|  __|    | |  | |  | |  ___/ 
 *  ____) | |____   | |  | |__| | |     
 * |_____/|______|  |_|   \____/|_|     
 -----------------------------------------------------*/
void setup() {
  size(1280, 720);
  frameRate(25);
  background(0);
  smooth();
}

/* ------------------------------------------------------
 *  _____  _____       __          __
 * |  __ \|  __ \     /\ \        / /
 * | |  | | |__) |   /  \ \  /\  / / 
 * | |  | |  _  /   / /\ \ \/  \/ /  
 * | |__| | | \ \  / ____ \  /\  /   
 * |_____/|_|  \_\/_/    \_\/  \/  
 --------------------------------------------------------*/

void draw() {

  ajoutAngleEffaceRouge = 0.000910;
  ajoutAngleEffaceVert = 0.000033;
  ajoutAngleEffaceBleu = 0.0116;

  angleEffaceRouge = ajoutAngle(angleEffaceRouge, ajoutAngleEffaceRouge);
  angleEffaceVert = ajoutAngle(angleEffaceVert, ajoutAngleEffaceVert);
  angleEffaceBleu = ajoutAngle(angleEffaceBleu, ajoutAngleEffaceBleu);

  float coefEffaceRouge = 0.7 + cos(angleEffaceRouge)*0.3;
  float coefEffaceVert = 0.4 + cos(angleEffaceVert) * 0.4;
  float coefEffaceBleu = 0.8 + cos(angleEffaceBleu) *0.2;


  loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int num = numPixel(x, y);
      color c = pixels[num];
      pixels[num] = color(red(c) * coefEffaceRouge, green(c)  * coefEffaceVert, blue(c)  * coefEffaceBleu);
    }
  }
  updatePixels();




  ajoutAngleRotationGlobale = -0.00865;
  angleRotationGlobale = ajoutAngle(angleRotationGlobale, ajoutAngleRotationGlobale);

  ajoutAngleRotationLines = 0.00001;
  angleRotationLines = ajoutAngle(angleRotationLines, ajoutAngleRotationLines);


  ajoutAngleLenLinesX1 = 0.00309;
  ajoutAngleLenLinesY1 = 0.00775;
  ajoutAngleLenLinesX2 = -0.00002;
  ajoutAngleLenLinesY2 = 0.00133;
  angleLenLinesX1 = ajoutAngle(angleLenLinesX1, ajoutAngleLenLinesX1);
  angleLenLinesY1 = ajoutAngle(angleLenLinesY1, ajoutAngleLenLinesY1);
  angleLenLinesX2 = ajoutAngle(angleLenLinesX2, ajoutAngleLenLinesX2);
  angleLenLinesY2 = ajoutAngle(angleLenLinesY2, ajoutAngleLenLinesY2);
  lenLineX1 = cos( angleLenLinesX1)*241;
  lenLineY1 = cos( angleLenLinesY1)*241; 
  lenLineX2 = cos( angleLenLinesX2)*252;
  lenLineY2 = cos( angleLenLinesY2)*253;

  ajoutAngleTailleGlobale = 0.00007;
  angleTailleGlobale = ajoutAngle(angleTailleGlobale, ajoutAngleTailleGlobale);
  for (float angleRef=0; angleRef<TWO_PI-0.01; angleRef+= TWO_PI/81) {
    pointRefX = cos(angleRef + angleRotationGlobale) * cos(angleTailleGlobale) * 400 + width/2;
    pointRefY = sin(angleRef + angleRotationGlobale) * cos(angleTailleGlobale) * 400 + height/2;



    point1X = cos(angleRef + angleRotationLines) * lenLineX1 + pointRefX;
    point1Y = sin(angleRef + angleRotationLines) * lenLineY1 + pointRefY;
    point2X = cos(angleRef + angleRotationLines + PI) * lenLineX2 + pointRefX;
    point2Y = sin(angleRef + angleRotationLines + PI) * lenLineY2 + pointRefY;

    rLine = 120 + cos(angleRef)*120;
    gLine = 220 + cos(angleRef * 0.89)*20;
    bLine = 200 + cos(angleRef * 4.14)*50;
    stroke(rLine, gLine, bLine, 10);
    strokeWeight(5);
    line(point1X, point1Y, point2X, point2Y);
    stroke(rLine, gLine, bLine, 20);
    strokeWeight(3);
    line(point1X, point1Y, point2X, point2Y);
    stroke(rLine, gLine, bLine, 100);
    strokeWeight(1);
    line(point1X, point1Y, point2X, point2Y);
  }
}

/* ---------------------------------------------------------
 *  ______ _    _ _   _  _____ _______ _____ ____  _   _  _____ 
 * |  ____| |  | | \ | |/ ____|__   __|_   _/ __ \| \ | |/ ____|
 * | |__  | |  | |  \| | |       | |    | || |  | |  \| | (___  
 * |  __| | |  | | . ` | |       | |    | || |  | | . ` |\___ \ 
 * | |    | |__| | |\  | |____   | |   _| || |__| | |\  |____) |
 * |_|     \____/|_| \_|\_____|  |_|  |_____\____/|_| \_|_____/ 
 ----------------------------------------------------------------*/

// ----------- Augmente un angle, revoie une valeur entre 0 et 2xPI
float ajoutAngle(float angle, float ajout) {
  angle+=ajout;
  if (angle>TWO_PI) {
    angle-=TWO_PI;
  }
  return angle;
}

// ------------------------ Numero du pixel dans le tableau pixels[]
int numPixel(int x, int y) {
  return y*width + x;
}
