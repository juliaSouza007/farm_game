void pausa() {
  if (continua.pressed==false) {
    pauseTime = millis();
    
    tela(width/2, 400);

    // Texto
    textFont(title, 45);
    fill(#4B240B);
    textAlign(CENTER);
    text("invetario", width/2, 200);

    inventario.inventory(width/2-180, height/2-50, 60, 60);

    continua.Show();
    continua.Selecionado();

    if (continua.pressed) {
      pause.pressed = false;
      pausado = false;
      time += pauseTime;
    }
  }
}
