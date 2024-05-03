
// Declaração da matriz grid para armazenar o estado de cada célula.
int[][] grid;
// Variavel para verificar a qntde de vezes que draw é executado
int tempo = 0;
// Cria botoes
Botao restart;
Botao mais;
Botao menos;
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

void setup(){
  size(600, 600); // Define o tamanho da janela de visualização.
  frameRate(10); // Define a taxa de atualização da janela.
  
  // Define os botoes da tela inicial
  play = new Botao(width/2-180/2, height-180, 180, 45, #795126, #34210C, "PLAY", #FFC85A, 30);
  exit = new Botao(width/2-180/2, height-110, 180, 35, #795126, #34210C, "EXIT", #FFC85A, 25);
  mais = new Botao(160, height-270, 100, 40, #795126, #34210C, "+", #FFC85A, 30);
  menos = new Botao(340, height-270, 100, 40, #795126, #34210C, "-", #FFC85A, 30);
  
  // Define a grade
  cenario = new Cenario();
  grid = cenario.criaGrid(); // Inicializa a grade com valores aleatórios.
  
  // Define o botoes da tela de pausa
  pause = new Botao(width-90, 10, 80, 40, #795126, #34210C, "||", #FFC85A, 30);
  continua = new Botao(width/2-180/2, height-180, 180, 45, #795126, #34210C, "CONTINUE", #FFC85A, 30);
  
  // Define os botoes da tela final
  restart = new Botao(155, height-140, 135, 45, #795126, #34210C, "RESTART", #FFC85A, 25);
  back = new Botao(320, height-140, 125, 45, #795126, #34210C, "BACK", #FFC85A, 25);
  
  // Define o jogador
  player = new Jogador();
  
  // Fontes
  fonte = createFont("Minecraft.ttf", 50);
  title = createFont("Minecrafter.Reg.ttf", 50);
  itens = createFont("minecraft_10.ttf", 50);
  
  telaInicial();
}

void draw(){
  tempo++;
  
  cenario.mostraGrid(); // Mostra a grade atual na janela.
  player.insereJogador();
  //telaInicial();
  
  noStroke();
  pause.Show();
  pause.Selecionado();
  if (pause.pressed) {
      pausa();
      continua.pressed = false;
    }
  
  //telaFinal();
  if(tempo%1/5==0) player.moveJogador();
  
}
