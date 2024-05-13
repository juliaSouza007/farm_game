class Objetos {
  public char[] objetos = {'a', 'C', 'E', 'F', 'n', 'm', 'e', 'G', 'M', 'P'};
  int posX;
  int posY;
  int i;
  int valor;
  int ultimoObjeto = 0;
  boolean mostrarItem = true;

  void sortearObjeto() {
    this.i = (int)random(0, 10);
    this.valor = this.i + 1;
  }

  void sorteiaPosicao(float largura, float altura) {
    boolean posicaoOK = false;

    // Arredonda os valores de l e h para o inteiro mais próximo
    largura = round(largura);
    altura = round(altura);

    // Calcula o número de segmentos ao longo de cada eixo
    int SegX = (int)(width / largura);
    int SegY = (int)(height / altura);

    // Loop até encontrar uma posição válida
    while (!posicaoOK) {
      // Gera índices de segmento aleatórios para cada eixo
      int tmpX = (int)(random(0, SegX)) * (int)largura;
      int tmpY = (int)(random(0, SegY)) * (int)altura;

      int x = calculaPosicaoX (tmpY, player);
      int y = calculaPosicaoY (tmpX, player);

      // Verifica se a posição gerada é um múltiplo de l e h
      if (tmpX % (int)largura == 0 && tmpY % (int)altura == 0) {
        if (x < cenario.n && y < cenario.c) {
          if (grid[x][y] == 1 || grid[x][y] == 2) {
            // Define a posição do objeto, considerando o centro do segmento
            this.posX = tmpX + (int)largura / 2;
            this.posY = tmpY + (int)altura / 2; // Adiciona 20 para deslocamento vertical
            posicaoOK = true; // Indica que a posição é válida e encerra o loop
          }
        }
      }
    }
  }

  int drawItem(int i, float y, Jogador jogador, ListaEncadeada inventario, int score) {
    int objY = calculaPosicaoY(posY, jogador);
    int objX = calculaPosicaoX(posX, jogador);
    if (mostrarItem) {
      // Adiciona o objeto à lista e soma o score quando o jogador passa sobre ele
      if (jogador.getJogadorX() == objX && jogador.getJogadorY() == objY) {
        Objetos tmp = new Objetos();

        tmp.i = this.i;
        tmp.valor = this.valor;

        inventario.add(tmp);

        score += tmp.valor;
        mostrarItem = false;
        player.insereJogador(); // Insere o jogador
      } else {
        textAlign(CENTER);
        textFont(itens, y - 8);
        fill(0);
        text(""+objetos[i], posX, posY + 20);
      }
    }

    return score;
  }


  boolean gerarItem() {
    int tempoAtual = millis();

    if (tempoAtual - ultimoObjeto >= 10000) {
      if (time < duracao) {
        ultimoObjeto = tempoAtual;
        mostrarItem = true;
        return true;
      }
    }
    return false;
  }

  int calculaPosicaoY (int posY, Jogador jogador) {
    return posY / (600/jogador.n);
  }

  int calculaPosicaoX (int posX, Jogador jogador) {
    return posX / (800/jogador.c);
  }
}
