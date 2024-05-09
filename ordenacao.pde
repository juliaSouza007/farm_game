Objetos item = new Objetos();
ListaEncadeada lista = new ListaEncadeada();

void setup() {
  size(800, 600); // Define o tamanho da tela

  // Adiciona uma sequencia de itens na lista
  for (int i = 0; i < 10; i++) {
    Objetos tmp = new Objetos();

    item.sortearObjeto();
    item.drawItem(item.i, 11, 13);

    tmp.i = item.i;
    tmp.valor = item.valor;

    lista.add(tmp);
  }

  println("Lista antes da ordenação:");
  lista.show();

  lista.shellSort();

  println("\nLista após a ordenação:");
  lista.show();

  println("\nLimpa lista:");
  lista.clear();
  lista.show();
}

void draw() {
  background(220); // Define a cor de fundo
}
