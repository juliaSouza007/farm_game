//numero de celulas
int linhas = 11;
int colunas = 13;
//personagem - creeper ou cabeca de abobora
int personagem = 1;

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

    // Sorteando primeira posicao dos itens a serem gerados
    item.sortearObjeto();
    item.sorteiaPosicao(cenario.l, cenario.h);
  }

  exit.Show();
  exit.Selecionado();

  maisLinha.Show();
  maisLinha.Selecionado();
  if (maisLinha.pressed) {
    if (linhas < 17) {
      linhas++; // Aumenta o numero de linhas

      // Atualiza o numero de linhas
      cenario.n = linhas;
      player.n = linhas;

      // Atualiza a posicao do jogador no centro da grade
      player.jogadorY = linhas / 2;

      grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
      maisLinha.pressed = false;
    }
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
    if (colunas < 17) {
      colunas++; // Aumenta o numero de colunas

      // Atualiza o numero de colunas
      cenario.c = colunas;
      player.c = colunas;

      // Atualiza a posicao do jogador no centro da grade
      player.jogadorX = colunas / 2;

      grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
      maisColuna.pressed = false;
    }
  }
  menosColuna.Show();
  menosColuna.Selecionado();
  if (menosColuna.pressed) {
    if (colunas > 13) {
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

  player1.Show();
  player1.Selecionado();
  if (player1.pressed) {
    personagem = 1; // define o personagem como 1
    player.personagem = 1; // atualiza o personagem
    player1.pressed = false;
  }

  player2.Show();
  player2.Selecionado();
  if (player2.pressed) {
    personagem = 2; // define o personagem como 1
    player.personagem = 2; // atualiza o personagem
    player2.pressed = false;
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

  textFont(fonte, 50);
  fill(#4B240B);
  textSize(25);
  text("PERSONAGEM:", width/2, 200);

  //creeper
  textFont(itens, 52);
  fill(#047415);
  rect(width/2-112, height-382, 26, 25);
  fill(#000000);
  text("A", width/2-98, height-358);

  //abobora
  textFont(itens, 22);
  fill(#FFAB03);
  rect(width/2+78, height-382, 25, 25);
  fill(#000000);
  text("K", width/2+92, height-358);
}

int nLinha () {
  return linhas;
}

int nColuna () {
  return colunas;
}

int Personagem() {
  return personagem;
}
