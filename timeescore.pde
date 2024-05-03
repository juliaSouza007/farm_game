int numlinhas = 10; // Número de linhas
int numcolunas = 10; // Número de colunas
int tamcelula = 50; // Tamanho das células
int X, Y; // Posição inicial do jogador
int[][] grid; // Grid do jogo
int score = 0; // Pontuação inicial do jogador
int startTime; // Tempo de início do jogo
int time; // Tempo atual do jogo
int duracao = 120000; // Duração do jogo em milissegundos (2 minutos)

void setup() {
  //algumas coisas do setup vcs ja fizeram, porem mantive por causa da parte do tempo (ultima linha)
  size(500, 500); // Define o tamanho da janela do jogo
  grid = new int[numlinhas][numcolunas]; // Inicializa a matriz grid
  X = numlinhas / 2; // Define a posição inicial X do jogador
  Y = numcolunas / 2; // Define a posição inicial Y do jogador
  grid[X][Y] = 2; // Marca a posição do jogador no grid
  startTime = millis(); // Inicia a contagem do tempo
}

void draw() {
  time = millis() - startTime; // Calcula o tempo decorrido
  background(255); // Define o fundo da tela como branco
  drawTimer(); // Desenha o temporizador
  drawScore(); // Desenha a pontuação
  if (time >= duracao) { // Verifica se o tempo acabou
    gameOver(); // Chama a função de fim de jogo
  }
}


void drawTimer() {
  int tempores = duracao - time; // Calcula o tempo restante
  int segundos = tempores / 1000; // Converte para segundos
  int minutos = segundos / 60; // Converte para minutos
  
   if (segundos < 0) { // Verifica se o tempo restante é menor que zero
    segundos = 0; // Define o tempo restante como zero
   }
   
   if (minutos < 0) { // Verifica se o tempo restante é menor que zero
    minutos = 0; // Define o tempo restante como zero
   }
   
  String temporizador = nf(minutos, 2) + ":" + nf(segundos % 60, 2); // Formata o temporizador
  fill(0); // Define a cor do texto como preto
  textAlign(LEFT); // Alinha o texto à esquerda
  textSize(20); // Define o tamanho do texto
  text("Timer: " + temporizador, 10, 30); // Mostra o temporizador na tela
}

void drawScore() {
  fill(0); // Define a cor do texto como preto
  textAlign(RIGHT); // Alinha o texto à direita
  textSize(20); // Define o tamanho do texto
  text("Score: " + score, width - 10, 30); // Mostra a pontuação na tela
}

void gameOver() {
  textAlign(CENTER); // Alinha o texto ao centro
  textSize(30); // Define o tamanho do texto
  text("Game Over!", width / 2, height / 2 - 30); // Mostra "Game Over!" na tela
  text("Score: " + score, width / 2, height / 2); // Mostra a pontuação na tela
  rectMode(CENTER); // Define o modo de desenho como centro
  fill(200); // Define a cor do botão
  rect(width / 2, height / 2 + 50, 120, 50); // Desenha o botão
  fill(0); // Define a cor do texto como preto
  textSize(20); // Define o tamanho do texto
  text("Recomeçar", width / 2, height / 2 + 55); // Mostra o texto do botão
}

void mousePressed() {
  //vcs ja fizeram tbm, porem mantive pq se nao daria erro no codigo
  if (mouseX > width / 2 - 60 && mouseX < width / 2 + 60 && mouseY > height / 2 + 25 && mouseY < height / 2 + 75) {
    restartGame(); // Se o botão for pressionado, reinicia o jogo
  }
}

void restartGame() {
  //algumas coisas da funçao vcs ja fizeram, porem mantive por causa da parte do tempo 
  score = 0; // Reinicia a pontuação
  startTime = millis(); // Reinicia o tempo
  for (int i = 0; i < numlinhas; i++) {
    for (int j = 0; j < numcolunas; j++) {
      
      if (random(1) < 0.9) { // Gera grama com 90% de chance
        grid[i][j] = 0; // Marca a célula como grama
        
      } else {
        grid[i][j] = 1; // Marca a célula como árvore
      }
    }
  }
  X = numlinhas / 2; // Reposiciona o jogador
  Y = numcolunas / 2; // Reposiciona o jogador
  grid[X][Y] = 2; // Marca a nova posição do jogador no grid
}
