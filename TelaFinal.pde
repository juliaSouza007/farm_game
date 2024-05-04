void telaFinal() {
  if (restart.pressed==false && back.pressed==false) {
    noStroke();
   
    tela(width/2, height-100);
    
    restart.Show();
    restart.Selecionado();
    if (restart.pressed) {
      grid = cenario.criaGrid(); 
      // Atualiza a posicao do jogador no centro da grade
      player.jogadorX = linhas / 2; 
      player.jogadorY = colunas / 2;
    }

    back.Show();
    back.Selecionado();
    if (back.pressed) {
      delay(100);
      play.pressed = false;
    }
    
    // Texto
    textFont(title, 50);
    fill(#4B240B);
    textAlign(CENTER);
    text("game over", width/2, 160);
    
    textFont(fonte, 50);
    fill(#4B240B);
    textSize(25);
    text("SCORE:", width/2, 220);

    fill(#4B240B);
    textSize(25);
    text("INVENTORY:", width/2, 250);

    inventory(120, 300, 60, 60);
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

void inventory(int x, int y, int l, int h) {
  
  for (int i = 0; i <= 4*(l+l/4); i+=l+l/4) {
    for (int j = 0; j < 2*(h+h/6); j+=h+h/6) {
      // fundo
      fill(#E8C68F);
      rect(x+i, y+j, l, h);
      rect(x+l+i, y+h/14+j, l/16, h*5/6);
      rect(x-l/16+i, y+h/14+j, l/16, h*5/6);
      
      // Sombra
      fill(#D8B781);
      rect(x+i, y-h/16+j, l, h/10);
      rect(x+l+i, y+h/14+j, l/16, h/6);
      rect(x-l/16+i, y+h/14+j, l/16, h/6);
      rect(x+l-h/16+i, y-h/16+j, l/16, h/5);
      rect(x-l/16+h/16+i, y-h/16+j, l/16, h/5);
    }
  }
}
