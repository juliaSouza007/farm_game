class Jogador {
  //numero de celulas
  int n = nLinha();
  int c = nColuna();
  int personagem = Personagem();
  // Posição do jogador na grade
  private int jogadorX, jogadorY;

  Jogador () {
    // Posiciona o jogador no centro da grade inicialmente
    jogadorX = c / 2;
    jogadorY = n / 2;
  }

  void insereJogador() {
    float lc = width / (float)c;
    float hc = height / (float)n;

    if (personagem == 2) {
      //abobora
      textFont(itens, hc - 10);
      fill(#FFAB03);
      rect(jogadorX * lc, jogadorY * hc, lc, hc);
      fill(#000000);
      textAlign(CENTER);
      text("K", jogadorX * lc + 32, jogadorY * hc + (hc - 4));
    } else {
      //creeper
      textFont(itens, hc + 40);
      fill(#047415);
      rect(jogadorX * lc, jogadorY * hc, lc, hc);
      fill(#000000);
      textAlign(CENTER);
      text("A", jogadorX * lc + 32, jogadorY * hc + (hc - 7));
    }
    //fill(cor);
    //rect(jogadorX * lc, jogadorY * hc, lc, hc);
  }

  void moveJogador() {
    if (time < duracao) {
      int novaPosX = jogadorX;
      int novaPosY = jogadorY;

      // Movimento do jogador apenas quando uma tecla é pressionada
      if (keyPressed) {

        if (keyCode == UP && jogadorY > 0) {
          novaPosY = jogadorY - 1;
        } else if (keyCode == DOWN && jogadorY < n - 1) {
          novaPosY = jogadorY + 1;
        } else if (keyCode == LEFT && jogadorX > 0) {
          novaPosX = jogadorX - 1;
        } else if (keyCode == RIGHT && jogadorX < c - 1) {
          novaPosX = jogadorX + 1;
        }


        // Verifica se o jogador não vai atravessar uma árvore
        if (grid[novaPosY][novaPosX] != 3) {
          jogadorX = novaPosX;
          jogadorY = novaPosY;
        }
      }
    }
  }
  
  //getters 
  public int getJogadorX () {
      return jogadorX;
  }
  public int getJogadorY () {
      return jogadorY;
  }
}
