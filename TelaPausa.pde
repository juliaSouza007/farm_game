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