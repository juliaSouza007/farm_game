void telaFinal() {
  if (restart.pressed==false || back.pressed==false) {
    noStroke();
    textAlign(CENTER);

    tela(width/2, height-100);

    restart.Show();
    restart.Selecionado();
    if (restart.pressed) {
      grid = cenario.criaGrid();
      // Atualiza a posicao do jogador no centro da grade
      player.jogadorX = colunas / 2;
      player.jogadorY = linhas / 2;

      score = 0; // Reinicia a pontuação
      startTime = millis(); // Reinicia o tempo
      inventario.clear(); // Limpa inventario
      
      restart.pressed = false;
    }

    back.Show();
    back.Selecionado();
    if (back.pressed) {
      delay(100);
      play.pressed = false;
      back.pressed = false;
      
      score = 0; // Reinicia a pontuação
      inventario.clear(); // Limpa inventario
    }

    // Texto
    textFont(title, 48);
    fill(#4B240B);
    text("time is over", width/2, 160);

    textFont(fonte, 50);
    fill(#4B240B);
    textSize(25);
    text("SCORE: " + score, width/2, 220);

    fill(#4B240B);
    textSize(25);
    text("INVENTORY:", width/2, 250);
    
    inventario.shellSort();
    inventario.inventory(width/2-180, height/2, 60, 60);

    // Garante que mostre a tela de pause apenas durante uma partida
    pause.pressed = false;
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
