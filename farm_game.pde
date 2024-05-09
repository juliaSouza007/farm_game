// Declaração da matriz grid para armazenar o estado de cada célula.
int[][] grid;
// Variavel para verificar a qntde de vezes que draw é executado
int tempo = 0;
// Cria botoes
Botao restart;
Botao maisLinha, maisColuna;
Botao menosLinha, menosColuna;
Botao play;
Botao exit;
Botao back;
Botao pause;
Botao continua;
// Fontes
PFont fonte;
PFont title;
PFont itens;
// Cria um jogador
Jogador player;
// Cria o Grid
Cenario cenario;
int score = 0; // Pontuação inicial do jogador
int startTime; // Tempo de início do jogo
int pauseTime; //pausar
double time; // Tempo atual do jogo
int duracao = 24000; // Duração do jogo em milissegundos (2 minutos)
boolean pausado = false;
double totalpause;
Objetos item = new Objetos();
ListaEncadeada inventario = new ListaEncadeada();

void setup() {
  size(800, 600); // Define o tamanho da janela de visualização.
  frameRate(10); // Define a taxa de atualização da janela.

  // Define os botoes da tela inicial
  play = new Botao(width/2-180/2, height-180, 180, 45, #795126, #34210C, "PLAY", #FFC85A, 30);
  exit = new Botao(width/2-180/2, height-110, 180, 35, #795126, #34210C, "EXIT", #FFC85A, 25);
  maisLinha = new Botao(width/2-140, height-280, 80, 30, #795126, #34210C, "+", #FFC85A, 20);
  menosLinha = new Botao(width/2-140, height-235, 80, 30, #795126, #34210C, "-", #FFC85A, 25);
  maisColuna = new Botao(width/2+50, height-280, 80, 30, #795126, #34210C, "+", #FFC85A, 20);
  menosColuna = new Botao(width/2+50, height-235, 80, 30, #795126, #34210C, "-", #FFC85A, 25);

  // Define a grade
  cenario = new Cenario();
  grid = cenario.criaGrid(); // Inicializa a grade com valores aleatórios.

  // Define o botoes da tela de pausa
  pause = new Botao(width-90, 45, 80, 40, #795126, #34210C, "||", #FFC85A, 30);
  continua = new Botao(width/2-180/2, height-180, 180, 45, #795126, #34210C, "CONTINUE", #FFC85A, 30);

  // Define os botoes da tela final
  restart = new Botao(width/2-145, height-140, 135, 45, #795126, #34210C, "RESTART", #FFC85A, 25);
  back = new Botao(width/2+20, height-140, 125, 45, #795126, #34210C, "BACK", #FFC85A, 25);

  // Define o jogador
  player = new Jogador();

  // Fontes
  fonte = createFont("Minecraft.ttf", 50);
  title = createFont("Minecrafter.Reg.ttf", 50);
  itens = createFont("minecraft_10.ttf", 50);

  telaInicial();
}

void draw() {
  tempo++;
  cenario.mostraGrid(); // Mostra a grade atual na janela.

  if (play.pressed) {

    if (item.gerarItem() == true) {
      item.sortearObjeto();
      item.sorteiaPosicao(cenario.l, cenario.h);
    }

    score = item.drawItem(item.i, cenario.h, player, inventario, score);

    player.insereJogador(); // Insere o jogador

    // Mostra o botao de pause
    noStroke();
    textAlign(CENTER);
    pause.Show();
    pause.Selecionado();
    if (pause.pressed) {
      pausado = true;
      pausa();
      continua.pressed = false;
    }

    drawTimer(); // Desenha o temporizador
    drawScore(); // Desenha a pontuação

    if (pausado == false) {
      time = millis() - startTime; // Calcula o tempo decorrido
    }

    if (pausado == true) {
      totalpause += (millis() - time);
    }

    if (continua.pressed) {
      if (millis() - startTime >= 12000 + totalpause) {
        time = millis() - startTime - totalpause;
      }
    }

    if (time >= duracao) { // Verifica se o tempo acabou
      telaFinal(); // Chama a função de fim de jogo
    }
  } else if (exit.pressed) {
    exit();
  } else {
    telaInicial(); // Mostra a tela inicial
  }

  if (tempo%1/5==0) player.moveJogador();
}
