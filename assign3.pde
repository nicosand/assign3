PImage bg1Img, bg2Img, treasureImg, fighterImg, enemyImg, hpImg;
int width = 640;
int x_bg1 = 0, x_bg2 = -640;
int x_treasure = floor(random(600)), y_treasure = floor(random(440)), x_hp = 200*1/5;
float x_fighter = 590, y_fighter = 215, speed = 5;
final int COUNT = 5;
float spacingX = 70, spacingY = 50;
float x, y;
float x1_enemy = -COUNT*spacingX, y1_enemy = random(420); 
float x2_enemy = -(width+2*COUNT*spacingX), y2_enemy = random(200, 420);
float x3_enemy = -(2*width+3*COUNT*spacingX), y3_enemy = random(100, 320);

boolean upPressed, downPressed, leftPressed, rightPressed = false;

void setup () {
  size(640, 480) ;
  bg1Img = loadImage("img/bg1.png");
  bg2Img = loadImage("img/bg2.png");
  treasureImg = loadImage("img/treasure.png");
  fighterImg = loadImage("img/fighter.png");
  enemyImg = loadImage("img/enemy.png");
  hpImg = loadImage("img/hp.png");

}

void draw() {

      //bg
      image(bg1Img, x_bg1, 0);
      x_bg1 += 3;
      if(x_bg1 >= width){
        x_bg1 = -640;
      }
      image(bg2Img, x_bg2, 0);
      x_bg2 += 3;
      if(x_bg2 >= width){
        x_bg2 = -640;
      }
      
      //treasure
      image(treasureImg, x_treasure, y_treasure);
      if(x_treasure >= (x_fighter+50) || x_treasure+40 <= x_fighter){
        x_hp += 0;
      }
      else if((y_treasure+40) < y_fighter || y_treasure > (y_fighter+50)){
        x_hp += 0;
      }else{
        x_treasure = floor(random(600));
        y_treasure = floor(random(440));
        if(x_hp == 200){
          x_hp += 0;
        }else{
        x_hp += 200*1/10;
        }
      }
   
      //fighter
      image(fighterImg, x_fighter, y_fighter);
      if(x_fighter >= 590){
        x_fighter = 590;
      }
      if(x_fighter <= 0){
        x_fighter = 0;
      }
      if(y_fighter >= 430){
        y_fighter = 430;
      }
      if(y_fighter <= 0){
        y_fighter = 0;
      }
      
      //fighter action
      if(upPressed){
        y_fighter -= speed;
      }
      if(downPressed){
        y_fighter += speed;
      }
      if(leftPressed){
        x_fighter -= speed;
      }
      if(rightPressed){
        x_fighter += speed;
      }
      
      //enemy
      pushMatrix();
      //first
      translate(x1_enemy, y1_enemy);
      for(int i=0; i<COUNT; i++){
        x = i*spacingX;
        y = 0;
        image(enemyImg,x,y);
      }
      x1_enemy += speed;
      if(x1_enemy >= width){
        x1_enemy = -(2*width+3*COUNT*spacingX);
        y1_enemy = random(420);
      };
      popMatrix();
      
      pushMatrix();
      //second
      translate(x2_enemy, y2_enemy);
      for(int i=0; i<COUNT; i++){
        x = i*spacingX;
        y = -i*spacingY;
        image(enemyImg,x,y);
      }
      x2_enemy += speed;
      if(x2_enemy >= width){
        x2_enemy = -(2*width+3*COUNT*spacingX);
        y2_enemy = random(200,420);
      };
      popMatrix();
      
      pushMatrix();
      //third
      translate(x3_enemy, y3_enemy);
      for(int i=0; i<COUNT; i++){
        x = i*spacingX;
        if(i %2 != 0){
        y = -spacingY;
      }
      else if(i == 2){
        y = -2*spacingY;
      }else{
        y=0;
      }
      image(enemyImg,x,y);
      }

      for(int i=0; i<COUNT; i++){
        x = i*spacingX;
        if(i %2 != 0){
        y = spacingY;
      }
      else if(i == 2){
        y = 2*spacingY;
      }else{
        y=0;
      }
        image(enemyImg,x,y);
      }
      x3_enemy += speed;
      if(x3_enemy >= width){
        x3_enemy = -(2*width+3*COUNT*spacingX);
        y3_enemy = random(100,320);
      };
      popMatrix();

      //hp
      fill(#ff0000);
      rect(20, 12, x_hp, 20, 12);
      image(hpImg, 10, 10);
}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  } 
}

void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
