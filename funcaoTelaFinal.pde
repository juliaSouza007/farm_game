void telaFinal() {
  if (restart.pressed==false) {
    noStroke();

    tela(width/2, height-100);
    
    restart.Show();
    restart.Selecionado();
    if (restart.pressed) {
      grid = cenario.criaGrid(); 
    }

    // Texto
    textFont(title, 50);
    fill(#4B240B);
    textAlign(CENTER);
    text("GAME OVER", width/2, 130);
    
    textFont(fonte, 50);
    fill(#4B240B);
    textSize(30);
    text("SCORE:", width/2, 170);

    fill(#4B240B);
    textSize(30);
    text("INVENTORY:", width/2, 200);

    inventory();
  }
}

  void tela(int largura, int altura) {
    rectMode(CENTER);

    // Sombra
    fill(#AA8F45);
    rect(width/2, height/2+25, largura, altura);
    rect(width/2-largura/2, height/2+25, 50, altura-50);
    rect(width/2+largura/2, height/2+25, 50, altura-50);
    rect(width/2-largura/2, height/2+25, 100, altura-100);
    rect(width/2+largura/2, height/2+25, 100, altura-100);

    //Fundo
    fill(#FAE2A2);
    rect(width/2, height/2, largura, altura);
    rect(width/2-largura/2, height/2, 50, altura-50);
    rect(width/2+largura/2, height/2, 50, altura-50);
    rect(width/2-largura/2, height/2, 100, altura-100);
    rect(width/2+largura/2, height/2, 100, altura-100);
    
    rectMode(0);
  }

void inventory() {
  int x = 300, y = 300;
  int l = 80, h = 80;
  // fundo
  // Botao
  fill(#F5D094);
  rect(x, y, l, h);
  rect(x+l, y+h/14, l/12, h*5/6);
  rect(x-l/16, y+h/14, l/16, h*5/6);
  
  // Sombra do botao
  fill(#D8B781);
  rect(x, y-h/16, l, h/10);
  rect(x+l, y+h/14, l/16, h/6);
  rect(x-l/16, y+h/14, l/16, h/6);
  rect(x+l-h/16, y-h/16, l/16, h/5);
  rect(x-l/16+h/16, y-h/16, l/16, h/5);
}
