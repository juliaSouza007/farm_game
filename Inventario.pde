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
      } else {
          No<T> end = head; // Corrigido para especificar o tipo de No<T>
          while (end.next != null) {
              end = end.next;
          }
          end.next = newNo;
      }
      listSize++;
  }

  void clear() {
    head = null;
  }

  void print() {
    No<T> atual = head;
    while (atual != null) {
      println(atual.item);
      atual= atual.next;
    }
    println();
  }
}
