//numero de celulas
int linhas = 11;
int colunas = 10;
//cor personagem
color cor;

void telaInicial () {
    noStroke();

    tela(width/2, height-100);
    
    play.Show();
    play.Selecionado();
    
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
      player.jogadorX = linhas / 2; 
      
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
        player.jogadorX = linhas / 2; 
        
        grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
        menosLinha.pressed = false;
      }
      
      maisColuna.Show();
      maisColuna.Selecionado();
      if (maisColuna.pressed) {
        colunas++; // Aumenta o numero de colunas
        
        // Atualiza o numero de colunas
        cenario.c = colunas; 
        player.c = colunas; 
        
        // Atualiza a posicao do jogador no centro da grade
        player.jogadorY = colunas / 2;
        
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
          player.jogadorY = colunas / 2;
          
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
    textSize(20);
    text("NUMERO DE LINHAS:",  width/2, height-250);
    text("NUMERO\nDE COLUNAS:", width/2, 200);
    
    textFont(title, 50);
    fill(#4B240B);
    textSize(25);
    text("PERSONAGEM", width/2, 200);
    
    // Garante que nao mostre a tela de pause antes da tela inicial
    pause.pressed = false;
  
}
