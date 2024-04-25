// Declaração da matriz grid para armazenar o estado de cada célula.
int[][] grid;
// Número de células em cada dimensão da grade.
int n = 15;
// Posição do jogador na grade
int jogadorX, jogadorY;
// Variavel para verificar a qntde de vezes que draw é executado
int tempo = 0;
// Cria botao de restart
Botao restart;

void setup(){
  size(600, 600); // Define o tamanho da janela de visualização.
  frameRate(10); // Define a taxa de atualização da janela.
  grid = criaGrid(); // Inicializa a grade com valores aleatórios.
  jogadorX = jogadorY = n / 2; // Posiciona o jogador no centro da grade inicialmente
  // Define o botao de restart que aparece na tela final
  restart = new Botao(width/2-180/2, height-130, 180, 45, #795126, #34210C, "RESTART", #FFC85A, 35);

}

// Cria e retorna uma matriz n x n com valores aleatórios.
int[][] criaGrid(){
  limpaGrid();
  int[][] m = new int[n][n];
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      float randomValue = random(1); // Gera um número aleatório entre 0 e 1
      
       // Convertendo o número aleatório em um valor inteiro entre 0 e 2
      int randomInt;
      if (randomValue < 0.45) {
        randomInt = 1; // Grama Baixa
      } else if (randomValue < 0.9) {
        randomInt = 2; // Grama Alta
      } else {
        randomInt = 3; // Árvore
      }
      
      m[i][j] = randomInt; // Atribui o valor aleatório à célula da matriz
    }
  }
  return m;
}

// Limpa os valores do grid
int[][] limpaGrid(){
  int[][] m = new int[n][n];
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      //m[i][j] = int(random(3)); // Atribui um valor aleatório entre 0 e 2 a cada célula.
      m[i][j] = m[0][0];
    }
  }
  return m;
}


// Desenha a grade na janela de visualização.
void mostraGrid(){
  float l = width / (float)n; // Calcula a largura de cada célula.
  float h = height / (float)n; // Calcula a altura de cada célula.
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      stroke(200); // Define a cor das bordas das células.
      
      // Define a cor de preenchimento com base no valor da célula.
      switch(grid[i][j]){
        case 1:
          fill(#2ECE37); // Grama Baixa.
          break;
        case 2:
          fill(#3FB229); // Grama Alta.
          break;
        case 3:
          fill(#816500); // Arvore
          break;
      }
      // Desenha o retângulo representando a célula.
      rect(j*l, i*h, l, h);
    }
  }
}

void insereJogador() { 
  float lc = width / (float)n;
  float hc = height / (float)n;

  fill(#0F2EF0);
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
      print("cima  direita");
      novaPosX = jogadorX + 1;
    }


      // Verifica se o jogador não vai atravessar uma árvore
      if (grid[novaPosY][novaPosX] != 3) {
        jogadorX = novaPosX;
        jogadorY = novaPosY;
      }
    
  }
}

void draw(){
  tempo++;
  
  mostraGrid(); // Mostra a grade atual na janela.
  insereJogador();
  if(tempo%2==0) moveJogador();
  
  // Se o mouse é pressionado, reinicializa a grade com valores aleatórios.
  if(mousePressed) grid = criaGrid();  
}
