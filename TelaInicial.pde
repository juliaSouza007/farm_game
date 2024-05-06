//numero de celulas
int linhas = 11;
int colunas = 13;
//cor personagem
color cor;

void telaInicial () {
  noStroke();

  tela(width/2, height-100);

  play.Show();
  play.Selecionado();
  if (play.pressed) {
    startTime = millis(); // Inicia a contagem do tempo
 
    // Atualiza a posicao do jogador no centro da grade
      player.jogadorX = colunas / 2;
      player.jogadorY = linhas / 2;
  }

  exit.Show();
  exit.Selecionado();

  maisLinha.Show();
  maisLinha.Selecionado();
  if (maisLinha.pressed) {
    linhas++; // Aumenta o numero de linhas

    // Atualiza o numero de linhas
    cenario.n = linhas;
    player.n = linhas;

    // Atualiza a posicao do jogador no centro da grade
    player.jogadorY = linhas / 2;

    grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
    maisLinha.pressed = false;
  }

  menosLinha.Show();
  menosLinha.Selecionado();
  if (menosLinha.pressed) {
    if (linhas > 11) {
      linhas--; // Reduz o numero de linhas

      // Atualiza o numero de linhas
      cenario.n = linhas;
      player.n = linhas;

      // Atualiza a posicao do jogador no centro da grade
      player.jogadorY = linhas / 2;

      grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
      menosLinha.pressed = false;
    }
  }

  maisColuna.Show();
  maisColuna.Selecionado();
  if (maisColuna.pressed) {
    colunas++; // Aumenta o numero de colunas

    // Atualiza o numero de colunas
    cenario.c = colunas;
    player.c = colunas;

    // Atualiza a posicao do jogador no centro da grade
    player.jogadorX = colunas / 2;

    grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
    maisColuna.pressed = false;
  }

  menosColuna.Show();
  menosColuna.Selecionado();
  if (menosColuna.pressed) {
    if (colunas > 10) {
      colunas--; // Reduz o numero de colunas

      // Atualiza o numero de colunas
      cenario.c = colunas;
      player.c = colunas;

      // Atualiza a posicao do jogador no centro da grade
      player.jogadorX = colunas / 2;

      grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
      menosColuna.pressed = false;
    }
  }

  // Texto
  textFont(title, 50);
  fill(#4B240B);
  textAlign(CENTER);
  text("minecraft", width/2, 150);

  textFont(fonte, 50);
  fill(#4B240B);
  textSize(18);
  text("NUMERO\n DE LINHAS:", width/2-100, height-310);
  text("NUMERO\n DE COLUNAS:", width/2+90, height-310);

  textFont(title, 50);
  fill(#4B240B);
  textSize(25);
  text("PERSONAGEM", width/2, 200);

}

int nLinha (){
    return linhas;
}

int nColuna (){
    return colunas;
}

color Personagem(){
    cor = color((int)random(225), (int)random(225), (int)random(225));
    return cor;
}
