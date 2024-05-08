int n = 20;
int[] array = new int[n];
int i = -1, j = -1, x;

// TRABALHO
Objetos item = new Objetos();
ListaEncadeada<Objetos> lista = new ListaEncadeada<Objetos>();

void setup() {
  size(800, 600); // Define o tamanho da tela
  for (int i = 0; i < array.length; i++) {
    array[i] = (int) random(height); // Atribui valores aleatórios ao array
  }

  //thread("ordenar"); // Executa paralelamente a função ordernar com a função draw

  // TRABALHO : adiciona uma sequencia de itens na lista
  for (int i = 0; i < 10; i++) {
    Objetos tmp = new Objetos();

    item.sortearObjeto();
    item.drawItem(item.i, 11, 13);

    tmp.i = item.i;
    tmp.valor = item.valor;

    lista.add(tmp);
  }

  // TRABALHO
  print();
}

void draw() {
  background(220); // Define a cor de fundo
  int l = width / n; // Defile a largura dos retângulos
}

// TRABALHO : Print os itens da lista
void print() {
  No<Objetos> atual = lista.head;
  while (atual != null) {
    atual.item.print();
    atual = atual.next;
  }
  println();
}

void ordenar() {
  while (true) {
    shellSort(lista);
    break;
  }
}

// TRABALHO : ShellSort
void shellSort(ListaEncadeada<Objetos> lista) {
  int n = lista.listSize; // Tamanho da lista
  x = 1;

  // Define de quanto em quanto serão feita as primeiras comparações
  while (x < n/3) x = (3*x) + 1;

  while (x >= 1) {

    for (i = 0; i < n; i++) {
      int temp = lista.get(i).i;
      j = i;

      // Compara o valor com outro valor que é x posições distante entre eles
      // Caso necessário, eles trocam de lugar
      while (j >= x && lista.get(j - x).i > temp) {
        lista.get(j).i = lista.get(j - x).i;
        j = j - x;
      }

      lista.get(j).i = temp;
    }

    // A distancia entre as comparações vão diminuindo
    x = x/3;
  }
}


// INVENTARIO
class No<T> {
  T item;
  No<T> next;

  No(T item) {
    this.item = item;
    this.next = null;
  }
}

class ListaEncadeada<T> {
  No<T> head;
  int listSize = 0;

  void add(T item) {
    No<T> newNo = new No<T>(item);

    if (head == null) {
      head = newNo;
      listSize++;
    } else {
      No<T> newItem = head;
      while (newItem.next != null) {
        newItem = newItem.next;
      }
      newItem.next = newNo;
      listSize++;
    }
  }

  void clear() {
    head = null;
  }

  T get(int indice) {
    int i = 0;

    No<T> atual = head;
    while (atual != null) {
      if (i == indice) {
        return atual.item;
      }
      atual = atual.next;
    }
    return null;
  }

  void print() {
    No<T> atual = head;
    while (atual != null) {
      println(atual.item);
      atual = atual.next;
    }
    println();
  }
}

// OBJETOS
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
    // if (time < duracao) {
    sorteiaPosicao(x, y);
    textAlign(CENTER);
    // textFont(itens, y - 8);
    fill(0);
    text(""+objetos[i], posX, posY);
    //  }
  }

  void print() {
    println(objetos[i]);
    println();
  }
}

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
