// No da lista de objetos
class No {
  Objetos item;
  No next;

  No(Objetos item) {
    this.item = item;
    this.next = null;
  }
}

// Lista de objetos
class ListaEncadeada {
  No head;

  ListaEncadeada() {
    head = null;
  }

  // Adiciona um objeto na lista
  void add(Objetos item) {
    No newItem = new No(item);

    if (head == null) {
      head = newItem;
    } else {
      No atual = head;
      while (atual.next != null) {
        atual = atual.next;
      }
      atual.next = newItem;
    }
  }

  // Limpa a lista
  void clear() {
    head = null;
  }

  // Obetem um elemento da lista
  Objetos get(int indice) {
    No atual = head;
    for (int i = 0; i < indice; i++) {
      atual = atual.next;
    }
    return atual.item;
  }

  // Autualiza um elemento da lista
  void set(int indice, Objetos novoItem) {
    No atual = head;
    for (int i = 0; i < indice; i++) {
      atual = atual.next;
    }
    atual.item = novoItem;
  }

  // Retorna o tamanho da lista
  int listSize() {
    int size = 0;
    No atual = head;

    while (atual != null) {
      size++;
      atual = atual.next;
    }
    return size;
  }

  // Mostra os itens da lista
  void show() {
    No atual = head;
    while (atual != null) {
      println(atual.item.objetos[atual.item.i]);
      atual = atual.next;
    }
  }

  void inventory(int x, int y, int l, int h) {
    Objetos item = new Objetos();
    // Quantidade de cada item
    int a=0, C=0, E=0, F=0, n=0, m=0, e=0, G=0, M=0, P=0;

    // Calcula a quantidade de cada item
    No atual = head;
    while (atual != null) {
      switch (atual.item.i) {
      case 0:
        a++;
        break;
      case 1:
        C++;
        break;
      case 2:
        E++;
        break;
      case 3:
        F++;
        break;
      case 4:
        n++;
        break;
      case 5:
        m++;
        break;
      case 6:
        e++;
        break;
      case 7:
        G++;
        break;
      case 8:
        M++;
        break;
      case 9:
        P++;
        break;
      default:
        break;
      }
      atual = atual.next;
    }

    for (int j = 0; j < 2*(h+h/6); j+=h+h/6) {
      for (int i = 0; i <= 4*(l+l/4); i+=l+l/4) {
        // fundo
        fill(#E8C68F);
        rect(x+i, y+j, l, h);
        rect(x+l+i, y+h/14+j, l/16, h*5/6);
        rect(x-l/16+i, y+h/14+j, l/16, h*5/6);

        // Sombra
        fill(#D8B781);
        rect(x+i, y-h/16+j, l, h/10);
        rect(x+l+i, y+h/14+j, l/16, h/6);
        rect(x-l/16+i, y+h/14+j, l/16, h/6);
        rect(x+l-h/16+i, y-h/16+j, l/16, h/5);
        rect(x-l/16+h/16+i, y-h/16+j, l/16, h/5);

        if (a > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[0], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+a, x+i + l-5, y+j + h-2);
          a = 0;
        } else if (C > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[1], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+C, x+i + l-5, y+j + h-2);
          C = 0;
        } else if (E > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[2], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+E, x+i + l-5, y+j + h-2);
          E = 0;
        } else if (F > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[3], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+F, x+i + l-5, y+j + h-2);
          F = 0;
        } else if (n > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[4], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+n, x+i + l-5, y+j + h-2);
          n = 0;
        } else if (m > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[5], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+m, x+i + l-5, y+j + h-2);
          m = 0;
        } else if (e > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[6], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+e, x+i + l-5, y+j + h-2);
          e = 0;
        } else if (G > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[7], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+G, x+i + l-5, y+j + h-2);
          G = 0;
        } else if (M > 0) {
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[8], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+M, x+i + l-5, y+j + h-2);
          M = 0;
        } else if (P > 0){
          textAlign(CENTER);
          textFont(itens, 45);
          fill(0);
          text(""+item.objetos[9], x+i + l/2, y+j + h-5);
          textFont(fonte, 15);
          text(""+P, x+i + l-5, y+j + h-2);
          P = 0;
        } 
      }
    }
  }

  // Ordena itens da lista
  void shellSort() {
    int n = listSize(); // Obtem tamanho da lista
    int x = 1;
    int j;

    // Define de quanto em quanto serão feita as primeiras comparações
    while (x < n/3) x = (3*x) + 1;

    // Continua até que a distância entre as comparações seja 1
    while (x >= 1) {
      // Percorre a lista
      for (int i = 0; i < n; i++) {
        // Cria um objeto temporário para armazenar o elemento atual
        Objetos temp = get(i);
        j = i;

        // Compara o valor com outro valor que é x posições distante entre eles
        // Caso necessário, eles trocam de lugar
        while (j >= x && get(j - x).valor > temp.valor) {
          set(j, get(j - x));
          j = j - x;
        }
        set(j, temp);
      }
      // A distancia entre as comparações vai diminuindo
      x = x/3;
    }
  }
}
