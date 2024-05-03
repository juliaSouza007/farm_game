class Jogador {
      //numero de celulas
      int n = nCelulas();
      // Posição do jogador na grade
      int jogadorX, jogadorY;
      //int color
      color cor = Personagem();
  
      Jogador (){
        // Posiciona o jogador no centro da grade inicialmente
        jogadorX = jogadorY = n / 2; 
      }
      
      void insereJogador() { 
        float lc = width / (float)cenario.n;
        float hc = height / (float)cenario.n;
      
        fill(cor);
        rect(jogadorX * lc, jogadorY * hc, lc, hc); 
      }
      
      void moveJogador() {
        int novaPosX = jogadorX;
        int novaPosY = jogadorY;
      
        // Movimento do jogador apenas quando uma tecla é pressionada
        if (keyPressed) {

          if (keyCode == UP && jogadorY > 0) {
            print("cima  ");
            novaPosY = jogadorY - 1;
          } else if (keyCode == DOWN && jogadorY < n - 1) {
            print("baixo  ");
            novaPosY = jogadorY + 1;
          } else if (keyCode == LEFT && jogadorX > 0) {
            print("esquerda  ");
            novaPosX = jogadorX - 1;
          } else if (keyCode == RIGHT && jogadorX < n - 1) {
            print("direita");
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
