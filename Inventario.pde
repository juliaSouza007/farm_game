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
    No atual = lista.head;
    while (atual != null) {
      println(atual.item.i);
      atual = atual.next;
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
        while (j >= x && get(j - x).i > temp.i) {
          set(j, lista.get(j - x));
          j = j - x;
        }

        set(j, temp);
      }

      // A distancia entre as comparações vai diminuindo
      x = x/3;
    }
  }
}
