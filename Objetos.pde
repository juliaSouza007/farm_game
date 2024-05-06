class Objetos {
  char[] objetos = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'};
  int posX;
  int posY;
  int i;
  int valor;

  void sortearObjeto() {
    this.i = (int) random(0, objetos.length);
    this.posX = (int) random(0, 800);
    this.posY = (int) random(0, 600);
    this.valor = this.i + 1;
    textFont(fonte, 50);
    text(objetos[i], posX, posY);
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
