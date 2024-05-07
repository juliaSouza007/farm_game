class Cenario {
  int n = nLinha();
  int c = nColuna();
  float l = width / (float)c; // Calcula a largura de cada célula.
  float h = height / (float)n; // Calcula a altura de cada célula.

  // Cria e retorna uma matriz n x n com valores aleatórios.
  int[][] criaGrid() {

    limpaGrid();
    int[][] m = new int[n][c];

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < c; j++) {
        float randomValue = random(1); // Gera um número aleatório entre 0 e 1

        // Convertendo o número aleatório em um valor inteiro entre 1 e 3
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
  int[][] limpaGrid() {
    int[][] m = new int[n][c];

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < c; j++) {
        m[i][j] = m[0][0];
      }
    }
    return m;
  }


  // Desenha a grade na janela de visualização.
  void mostraGrid() {
    l = width / (float)c; // Calcula a largura de cada célula.
    h = height / (float)n; // Calcula a altura de cada célula.

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < c; j++) {
        stroke(200); // Define a cor das bordas das células.

        // Define a cor de preenchimento com base no valor da célula.
        switch(grid[i][j]) {
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
}
