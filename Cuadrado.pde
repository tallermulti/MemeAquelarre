class Cuadrado {
  boolean borrando;
  float x, y;
  float velX, velY;
  float posX, posY;
  float dist;
  float tamano;
  Juego juego;



  Cuadrado(Juego juego) {

    tamano = 120;
    x=random(0, width-tamano);
    y=random(40, height-tamano);


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
    rect(x,y,tamano, tamano);
    x=x+velX;
    y=y+velY;
    popStyle();

    noStroke();

    if ((x + tamano > width) || (x < 0)) {
      velX= -velX;
    }



    if ((y + tamano > height) || (y < 40)) {
      velY= -velY;
    }
  }
  
  void mouseClicked() {
    if(mousePressed && !borrando){
      if(mouseX > x && mouseX < x + tamano && mouseY > y && mouseY < y + tamano){
        borrando = true;
        juego.agrandar();
      }
    }
  }
}
