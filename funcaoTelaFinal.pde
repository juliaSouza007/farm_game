void telaFinal() {
 background(#43DE7F);
 PFont fonte;
 //String[] fontList = PFont.list();
 //printArray(fontList);
 
 int largura = width/2;
 int altura = height-100;
 
 // Sombra 
 fill(#AA8F45);
 stroke(#AA8F45);
 rect(width/2, height-50, largura, 50);
 rect(width/2-largura/2, height-75, 50, 50);
 rect(width/2+largura/2, height-75, 50, 50);
 rect(width/2-largura/2-25, height-100, 50, 50);
 rect(width/2+largura/2+25, height-100, 50, 50);
 
 //Fundo
 fill(#FAE2A2);
 stroke(#FAE2A2);
 rectMode(CENTER);
 rect(width/2, height/2, largura, altura);
 rect(width/2-largura/2, height/2, 50, altura-50);
 rect(width/2+largura/2, height/2, 50, altura-50);
 rect(width/2-largura/2, height/2, 100, altura-100);
 rect(width/2+largura/2, height/2, 100, altura-100);
 
 int larguraBotao = 180;
 int alturaBotao = 45;
 
 //Sombra botão restart
 fill(#34210C);
 stroke(#34210C);
 rectMode(CENTER);
 rect(width/2, height-110+alturaBotao/2, larguraBotao, alturaBotao/4);
 rect(width/2+larguraBotao/2, height-120+alturaBotao/2, larguraBotao/8, alturaBotao/4);
 rect(width/2-larguraBotao/2, height-120+alturaBotao/2, larguraBotao/8, alturaBotao/4);

 // Botão restart
 fill(#795126);
 stroke(#795126);
 rectMode(CENTER);
 rect(width/2, height-115, larguraBotao, alturaBotao);
 rect(width/2+larguraBotao/2, height-115, larguraBotao/8, alturaBotao/2);
 rect(width/2-larguraBotao/2, height-115, larguraBotao/8, alturaBotao/2);

 // Texto
 fonte = createFont("Courier New Bold Italic", 50);
 textFont(fonte);
 fill(#4B240B);
 textAlign(CENTER);
 text("GAME OVER", width/2, 130);
 
 fill(#4B240B);
 textSize(30);
 textAlign(RIGHT);
 text("SCORE:", 250, 180);

 fill(#4B240B);
 textSize(30);
 textAlign(RIGHT);
 text("INVENTORY:", 320, 210);
  
 fill(#4B240B);
 textSize(35);
 textAlign(CENTER);
 text("RESTART", width/2, height-100);
}
