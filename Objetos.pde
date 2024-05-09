class Objetos {
  public char[] objetos = {'a', 'C', 'E', 'F', 'n', 'm', 'e', 'G', 'M', 'P'};
  int posX;
  int posY;
  int i;
  int valor;
  int ultimoObjeto = 0;
  boolean mostrarItem = true;
  ListaEncadeada<Objetos> inventario = new ListaEncadeada<Objetos>();

  void sortearObjeto() {
      this.i = (int)random(0, 9); //(int) random(0, objetos.length);
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
          
          // Verifica se a posição gerada é um múltiplo de l e h
          if (tmpX % (int)largura == 0 && tmpY % (int)altura == 0) { 
            
              // Define a posição do objeto, considerando o centro do segmento
              this.posX = tmpX + (int)largura / 2;
              this.posY = tmpY + (int)altura / 2 + 20; // Adiciona 20 para deslocamento vertical
              posicaoOK = true; // Indica que a posição é válida e encerra o loop
          }
      }
  }

  void drawItem(int i, float y, Jogador jogador) {
    int objY = calcularPosicaoY(posY, jogador);
    int objX = calculaPosicaoX(posX, jogador);
    if (mostrarItem) {
      if (jogador.getJogadorX() == objX && jogador.getJogadorY() == objY) {
        // Adiciona o objeto à lista quando o jogador passa sobre ele
        //O this é uma referência para o próprio objeto que está chamando o método. No contexto do método drawItem da classe Objetos, this se refere à instância atual da classe Objetos.
        inventario.add(this);
        inventario.print();
        mostrarItem = false;
      } else {
        textAlign(CENTER);
        textFont(itens, y - 8);
        fill(0);
        text(""+objetos[i], posX, posY);
      }
    }
  }
  
  
  boolean gerarItem() {
      int tempoAtual = millis();
      
      if (tempoAtual - ultimoObjeto >= 10000) {
          ultimoObjeto = tempoAtual;
          mostrarItem = true;
          return true;
      }
      return false;
  }
  
  int calcularPosicaoY (int posY, Jogador jogador) {
     return posY / (600/jogador.n);
  }
  
  int calculaPosicaoX (int posX, Jogador jogador) {
    return posX / (800/jogador.c);
  }
  
}
