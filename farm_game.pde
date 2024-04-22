// Declaração da matriz grid para armazenar o estado de cada célula.
int[][] grid;
// Número de células em cada dimensão da grade.
int n = 15;
// Posição do jogador na grade
int jogadorX, jogadorY;

void setup(){
  size(600, 600); // Define o tamanho da janela de visualização.
  frameRate(10); // Define a taxa de atualização da janela.
  grid = criaGrid(); // Inicializa a grade com valores aleatórios.
  jogadorX = jogadorY = n / 2; // Posiciona o jogador no centro da grade inicialmente
}

// Cria e retorna uma matriz n x n com valores aleatórios.
int[][] criaGrid(){
  int[][] m = new int[n][n];
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      //m[i][j] = int(random(3)); // Atribui um valor aleatório entre 0 e 2 a cada célula.
      m[i][j] = (random(1) < 0.45)? 1: m[i][j];
      m[i][j] = (random(1) < 0.1)? 2: m[i][j];
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
          fill(#8E5800); // Árvore.
          break;
        default:
          fill(#008E08); // Grama Alta.
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


void moverJogador() {
// Movimento do jogador apenas quando uma tecla é pressionada
  if (keyPressed) {
    int novaPosX = jogadorX;
    int novaPosY = jogadorY;
    
    if (keyCode == UP && jogadorY > 0) {
      novaPosY = jogadorY - 1;
    } else if (keyCode == DOWN && jogadorY < n - 1) {
      novaPosY = jogadorY + 1;
    } else if (keyCode == LEFT && jogadorX > 0) {
      novaPosX = jogadorX - 1;
    } else if (keyCode == RIGHT && jogadorX < n - 1) {
      novaPosX = jogadorX + 1;
    }
    
    // Verifica se a nova posição é válida antes de atualizar a posição do jogador
    if (novaPosX != jogadorX || novaPosY != jogadorY) {
      // Verifica se o jogador não vai atravessar uma árvore
      if (grid[novaPosY][novaPosX] != 2) {
        jogadorX = novaPosX;
        jogadorY = novaPosY;
      }
    }
    delay(50); //Evita duplo clique
  }
}

void draw(){
  mostraGrid(); // Mostra a grade atual na janela.
  insereJogador();
  moverJogador();
  
  // Se o mouse é pressionado, reinicializa a grade com valores aleatórios.
  if(mousePressed) grid = criaGrid();
}
