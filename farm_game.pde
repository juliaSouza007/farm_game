// Declaração da matriz grid para armazenar o estado de cada célula.
int[][] grid;
// Número de células em cada dimensão da grade.
int n = 15;

void setup(){
  size(800, 800); // Define o tamanho da janela de visualização.
  frameRate(10); // Define a taxa de atualização da janela.
  grid = criaGrid(); // Inicializa a grade com valores aleatórios.
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

void draw(){
  mostraGrid(); // Mostra a grade atual na janela.
  
  // Se o mouse é pressionado, reinicializa a grade com valores aleatórios.
  if(mousePressed) grid = criaGrid();
}
