void drawTimer() {
  int tempores = duracao - (int)time; // Calcula o tempo restante
  int segundos = tempores / 1000; // Converte para segundos
  int minutos = segundos / 60; // Converte para minutos
  
   if (segundos < 0) { // Verifica se o tempo restante é menor que zero
    segundos = 0; // Define o tempo restante como zero
   }
   
   if (minutos < 0) { // Verifica se o tempo restante é menor que zero
    minutos = 0; // Define o tempo restante como zero
   }
   
  String temporizador = nf(minutos, 2) + ":" + nf(segundos % 60, 2); // Formata o temporizador
  fill(0); // Define a cor do texto como preto
  textAlign(LEFT); // Alinha o texto à esquerda
  textSize(20); // Define o tamanho do texto
  text("Timer: " + temporizador, 10, 30); // Mostra o temporizador na tela
}

void drawScore() {
  fill(0); // Define a cor do texto como preto
  textAlign(RIGHT); // Alinha o texto à direita
  textSize(20); // Define o tamanho do texto
  text("Score: " + score, width - 25, 30); // Mostra a pontuação na tela
}
