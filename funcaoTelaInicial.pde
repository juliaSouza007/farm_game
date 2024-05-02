//numero de celulas
int num = 11;
//cor personagem
color cor;


void telaInicial () {
  if (play.pressed==false) {
    noStroke();

    tela(width/2, height-100);
    
    play.Show();
    play.Selecionado();
    if (play.pressed) {
      grid = cenario.criaGrid(); 
    }
    
    mais.Show();
    mais.Selecionado();
    if (mais.pressed) {
      num++;
      cenario.n = num;
    }
    
    menos.Show();
    menos.Selecionado();
    if (menos.pressed) {
      if (num > 11) {
        num--;
        cenario.n = num;
      }
    }
    
    mais.Show();
    mais.Selecionado();
    if (mais.pressed) {
      num++;
      cenario.n = num;
    }
    
    menos.Show();
    menos.Selecionado();
    if (menos.pressed) {
      if (num > 11) {
        num--;
        cenario.n = num;
      }
    }

    // Texto
    textFont(title, 50);
    fill(#4B240B);
    textAlign(CENTER);
    text("minecraft", width/2, 150);
    
    textFont(title, 50);
    fill(#4B240B);
    textSize(30);
    text("NUMERO DE CELULAS", width/2, 370);
    
    textFont(title, 50);
    fill(#4B240B);
    textSize(30);
    text("PERSONAGEM", width/2, 240);
  }
}

int nCelulas (){
    return num;
}

color Personagem(){
    cor = color((int)random(225), (int)random(225), (int)random(225));
    return cor;
}
