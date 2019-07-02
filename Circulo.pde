class Circulo {
  boolean borrando;
  float x, y;
  float velX, velY;
  float posX, posY;
  float dist;
  float tamano;
  Juego juego;



  Circulo(Juego juego) {

    tamano = 120;
    x=random(tamano / 2, width - tamano / 2);
    y=random(40 + tamano / 2, height - tamano / 2);


    velX=random(-5, 5);
    velY=random(-5, 5);
    borrando = false;
    this.juego = juego;
  }


  void dibujar() {
    pushStyle();
    noStroke();
    fill(random(50, 255), random(50, 255), random(50, 255));
    if(borrando) tamano = max(0, tamano - 4);
    ellipse(x, y, tamano, tamano);
    x=x+velX;
    y=y+velY;
    popStyle();

    noStroke();

    if ((x + tamano / 2 > width) || (x < tamano / 2)) {
      velX= -velX;
    }



    if ((y + tamano / 2  >height )|| (y < tamano / 2 + 40)) { 
      velY= -velY;
    }
  }
  
  void mouseClicked() {
    float dist= dist(x,y ,mouseX, mouseY); 
    if (dist <= 50 && mousePressed && !borrando) {
      borrando = true;
      juego.agrandar();
    }
  }
}
