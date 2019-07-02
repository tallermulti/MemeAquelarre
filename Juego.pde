class Juego {
  
  int cantCirculos = 10;
  int cantCuadrados = 10;
  
  int borrados;
  float tamano;
  float transparencia;
  
  float rojo, azul, verde;
  
  
  Circulo[] circulos;
  Cuadrado[] cuadrados;

  String estado;
  

  Juego(){
    nuevoNivel();
  }

  void jugar(){ 
    background(rojo,azul,verde);
    float largo = map(borrados, 0, cantCirculos + cantCuadrados, 10, width - 10);
    fill(255);
    rect(10,10,largo, 30);
    for(int i =0; i<cantCirculos;i++){ 
      circulos[i].dibujar();
      circulos[i].mouseClicked();
    }
    
    for(int i=0; i<cantCuadrados; i++){
      cuadrados[i].dibujar();   
      cuadrados[i].mouseClicked();
    }
    
    fill(100, transparencia);
    ellipse (mouseX, mouseY, tamano, tamano);
  }
  
  void agrandar(){
    borrados += 1;
    tamano += 20;
    transparencia = min(240, transparencia + 3);
    if(borrados == cantCirculos + cantCuadrados){
      nuevoNivel();
    }
  }
  
  void nuevoNivel(){
    circulos= new Circulo[cantCirculos];
    for(int i=0; i<cantCirculos; i++){
      circulos[i]= new Circulo(this);
    }
    
    cuadrados= new Cuadrado[cantCuadrados];
    for(int i=0; i<cantCuadrados; i++){
      cuadrados[i]= new Cuadrado(this);
    }
    
    borrados = 0;
    rojo = random(0,255);
    azul = random(0,255);
    verde = random(0,255);
    tamano = 60;
    transparencia = 200;
  }
}
  
