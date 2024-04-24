void telaFinal() {
  if (restart.pressed==false) {
    noStroke();
    PFont fonte;

    tela(width/2, height-100);
    
    restart.Show();
    restart.Selecionado();
    if (restart.pressed) {
      grid = criaGrid(); 
    }

      // Texto
      fonte = createFont("Courier New Bold Italic", 50);
    textFont(fonte);
    fill(#4B240B);
    textAlign(CENTER);
    text("GAME OVER", width/2, 120);

    fill(#4B240B);
    textSize(30);
    text("SCORE:", width/2, 170);

    fill(#4B240B);
    textSize(30);
    text("INVENTORY:", width/2, 200);
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
