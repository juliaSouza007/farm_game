// Declaração da matriz grid para armazenar o estado de cada célula.
int[][] grid;
// Variavel para verificar a qntde de vezes que draw é executado
int tempo = 0;
// Cria botoes
Botao restart;
Botao mais;
Botao menos;
Botao play;
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
  play = new Botao(width/2-180/2, height-130, 180, 45, #795126, #34210C, "PLAY", #FFC85A);
  mais = new Botao(160, height-210, 100, 45, #795126, #34210C, "+", #FFC85A);
  menos = new Botao(340, height-210, 100, 45, #795126, #34210C, "-", #FFC85A);
  
  // Define a grade
  cenario = new Cenario();
  grid = cenario.criaGrid(); // Inicializa a grade com valores aleatórios.
  
  // Define o botao de restart que aparece na tela final
  restart = new Botao(width/2-180/2, height-130, 180, 45, #795126, #34210C, "RESTART", #FFC85A);
  
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
  //telaFinal();
  
  if(tempo%1/5==0) player.moveJogador();
  
  // Se o mouse é pressionado, reinicializa a grade com valores aleatórios.
  if(mousePressed) grid = cenario.criaGrid();  
}
