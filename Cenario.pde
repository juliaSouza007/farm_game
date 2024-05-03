
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
  size(800, 600); // Define o tamanho da janela de visualização.
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
  
  if (play.pressed==false) {
    telaInicial(); // Mostra a tela inicial
    
  } else {
    player.insereJogador(); // Insere o jogador 
    
    // Mostra o botao de pause
    noStroke();
    pause.Show();
    pause.Selecionado();
    if (pause.pressed) {
        pausa();
        continua.pressed = false;
      }
  }
  
  if (tempo >= 50) {
    telaFinal();
  }
 
  if(tempo%1/5==0) player.moveJogador();
  
}
 
// Tela Inicial
//numero de celulas
int linhas = 11;
int colunas = 10;
//cor personagem
color cor;

void telaInicial () {
    noStroke();

    tela(width/2, height-100);
    
    play.Show();
    play.Selecionado();
    
    exit.Show();
    exit.Selecionado();
    
    mais.Show();
    mais.Selecionado();
    if (mais.pressed) {
      linhas++; // Aumenta o numero de linhas
      colunas++; // Aumenta o numero de colunas
      
      cenario.n = linhas; // Atualiza o numero de linhas
      cenario.c = colunas; // Atualiza o numero de colunas
      
      player.n = linhas; // Atualiza o numero de linhas
      player.c = colunas; // Atualiza o numero de colunas
      
      // Atualiza a posicao do jogador no centro da grade
      player.jogadorX = linhas / 2; 
      player.jogadorY = colunas / 2;
      
      grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
      mais.pressed = false;
    }
    
    menos.Show();
    menos.Selecionado();
    if (menos.pressed) {
      if (linhas > 11) {
        linhas--; // Reduz o numero de linhas
        colunas--; // Reduz o numero de colunas
        
        cenario.n = linhas; // Atualiza o numero de linhas
        cenario.c = colunas; // Atualiza o numero de colunas
        
        player.n = linhas; // Atualiza o numero de linhas
        player.c = colunas; // Atualiza o numero de colunas
        
        // Atualiza a posicao do jogador no centro da grade
        player.jogadorX = linhas / 2; 
        player.jogadorY = colunas / 2;
        
        grid = cenario.criaGrid(); // Cria um novo grid com a nova quantidade de celulas
        menos.pressed = false;
      }
    }

    // Texto
    textFont(title, 50);
    fill(#4B240B);
    textAlign(CENTER);
    text("minecraft", width/2, 150);
    
    textFont(title, 50);
    fill(#4B240B);
    textSize(25);
    text("NUMERO DE CELULAS", width/2, 310);
    
    textFont(title, 50);
    fill(#4B240B);
    textSize(25);
    text("PERSONAGEM", width/2, 200);
    
    // Garante que nao mostre a tela de pause antes da tela inicial
    pause.pressed = false;
  
}

// Tela Pause
int nLinha (){
    return linhas;
}

int nColuna (){
    return colunas;
}

color Personagem(){
    cor = color((int)random(225), (int)random(225), (int)random(225));
    return cor;
}


void pausa() {
  if (continua.pressed==false) {
    
   tela(width/2, 400);
   
    // Texto
    textFont(title, 45);
    fill(#4B240B);
    textAlign(CENTER);
    text("invetario", width/2, 200);
   
   inventory(120, 250, 60, 60);
   
   continua.Show();
   continua.Selecionado();
   if (continua.pressed) {
      pause.pressed = false;
    }
  }
}

// Tela Final

void telaFinal() {
  if (restart.pressed==false && back.pressed==false) {
    noStroke();
   
    tela(width/2, height-100);
    
    restart.Show();
    restart.Selecionado();
    if (restart.pressed) {
      grid = cenario.criaGrid(); 
      // Atualiza a posicao do jogador no centro da grade
      player.jogadorX = linhas / 2; 
      player.jogadorY = colunas / 2;
    }

    back.Show();
    back.Selecionado();
    if (back.pressed) {
      delay(100);
      play.pressed = false;
    }
    
    // Texto
    textFont(title, 50);
    fill(#4B240B);
    textAlign(CENTER);
    text("game over", width/2, 160);
    
    textFont(fonte, 50);
    fill(#4B240B);
    textSize(25);
    text("SCORE:", width/2, 220);

    fill(#4B240B);
    textSize(25);
    text("INVENTORY:", width/2, 250);

    inventory(120, 300, 60, 60);
  }
}

  void tela(int largura, int altura) {
    rectMode(CENTER);

    // Sombra
    fill(#AA8F45);
    rect(width/2, height/2+25, largura, altura);
    rect(width/2-largura/2, height/2+25, 50, altura-50);
    rect(width/2+largura/2, height/2+25, 50, altura-50);
    rect(width/2-largura/2, height/2+25, 100, altura-100);
    rect(width/2+largura/2, height/2+25, 100, altura-100);

    //Fundo
    fill(#FAE2A2);
    rect(width/2, height/2, largura, altura);
    rect(width/2-largura/2, height/2, 50, altura-50);
    rect(width/2+largura/2, height/2, 50, altura-50);
    rect(width/2-largura/2, height/2, 100, altura-100);
    rect(width/2+largura/2, height/2, 100, altura-100);
    
    rectMode(0);
  }

void inventory(int x, int y, int l, int h) {
  
  for (int i = 0; i <= 4*(l+l/4); i+=l+l/4) {
    for (int j = 0; j < 2*(h+h/6); j+=h+h/6) {
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
    }
  }
}


