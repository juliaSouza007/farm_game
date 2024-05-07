class Objetos {
  char[] objetos = {'a', 'C', 'E', 'F', 'n', 'm', 'e', 'G', 'M', 'P'};
  int posX;
  int posY;
  int i;
  int valor;

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
    int numSegmentsX = (int)(width / largura);
    int numSegmentsY = (int)(height / altura);
    
    // Loop até encontrar uma posição válida
    while (!posicaoOK) {
        // Gera índices de segmento aleatórios para cada eixo
        int tmpX = (int)(random(0, numSegmentsX)) * (int)largura;
        int tmpY = (int)(random(0, numSegmentsY)) * (int)altura;
        
        // Verifica se a posição gerada é um múltiplo de l e h
        if (tmpX % (int)largura == 0 && tmpY % (int)altura == 0) {
            // Define a posição do objeto, considerando o centro do segmento
            this.posX = tmpX + (int)largura / 2;
            this.posY = tmpY + (int)altura / 2 + 20; // Adiciona 20 para deslocamento vertical
            posicaoOK = true; // Indica que a posição é válida e encerra o loop
        }
    }
}


  void drawItem(int i, float x, float y) {
    if (time < duracao) {
      sorteiaPosicao(x, y);
      textAlign(CENTER);
      textFont(itens, y - 8);
      fill(0);
      text(""+objetos[i], posX, posY);
    }
  }
}

ListaEncadeada<Objetos> lista = new ListaEncadeada<Objetos>();

/*void setup() {
 size(800, 600);
 for (int i = 0; i < 10; i++) {
 Objetos obj = new Objetos();
 obj.sortearObjeto();
 lista.add(obj);
 }
 }
 
 void draw() {
 // Desenhe sua cena aqui
 // Por exemplo:
 background(255);
 lista.print(); // Imprimir objetos na lista
 }*/
