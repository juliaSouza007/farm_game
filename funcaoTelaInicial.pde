//numero de celulas
int num = 11;
//cor personagem
color cor;

void telaInicial () {
  if (play.pressed==false) {
    noStroke();

    tela(width/2, height-100);
    
    play.Show();
    play.Selecionado();
    
    exit.Show();
    exit.Selecionado();
    
    mais.Show();
    mais.Selecionado();
    if (mais.pressed) {
      num++; // Aumenta o numero de celulas
      cenario.n = num; // Atualiza o numero de celulas
      player.n = num; // Atualiza o numero de celulas
      // Atualiza a posicao do jogador no centro da grade
      player.jogadorX = num / 2; 
      player.jogadorY = num / 2;
      grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
      mais.pressed = false;
    }
    
    menos.Show();
    menos.Selecionado();
    if (menos.pressed) {
      if (num > 11) {
        num--; // Reduz o numero de celulas
        cenario.n = num; // Atualiza o numero de celulas
        player.n = num; // Atualiza o numero de celulas
        // Atualiza a posicao do jogador no centro da grade
        player.jogadorX = num / 2; 
        player.jogadorY = num / 2;
        grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
        menos.pressed = false;
      }
    }

    // Texto
    textFont(title, 50);
    fill(#4B240B);
    textAlign(CENTER);
    text("minecraft", width/2, 150);
    
    textFont(title, 50);
    fill(#4B240B);
    textSize(25);
    text("NUMERO DE CELULAS", width/2, 310);
    
    textFont(title, 50);
    fill(#4B240B);
    textSize(25);
    text("PERSONAGEM", width/2, 200);
  }
}

int nCelulas (){
    return num;
}

color Personagem(){
    cor = color((int)random(225), (int)random(225), (int)random(225));
    return cor;
}
