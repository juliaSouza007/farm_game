# farm_game
Trabalho 1 de AEDS

Desenvolver, em processing, um jogo composto por um grid retangular de N linhas e M colunas. Cada célula do grid pode ser grama, árvore (obstáculo), o jogador ou um item.

Inicialmente as células do grid devem ser inicializadas como grama (probabilidade de 90%) ou árvores (probabilidade de 10%). Na célula no centro do grid (N/2, M/2) deve ser colocado o jogador.

O jogador deve poder se movimentar no grid pulando para as células adjacentes usando as setas do teclado


   ⬆️
   
⬅️ 🏌️ ➡️

  ⬇️


Quando o jogador entrar em uma célula com um item, o item deve ser coletado e ir para o inventário do jogador. O jogador não pode se mover para uma célula de árvore.

Os itens devem ser gerados automaticamente em uma célula de grama sorteada a cada 10 segundos. Devem ser desenvolvidos 10 tipos de itens com valores de 1 até 10. A cada item adicionado no inventário, o seu valor deve ser adicionado ao score (pontuação) do jogador.

Cada partida deve durar 2 minutos e, ao fim dela deve ser apresentado o score e o inventário do jogador ordenado pelo valor dos itens, além de um botão para recomeçar.

Na tela deve ser mostrado o timer no canto superior esquerdo e o score no canto superior  direito.

# Divisão de Tarefas
Aluno 1 - Criação do grid, movimentação do jogador

Aluno 2 - Criação do inventário usando uma lista (implementação própria)

Aluno 3 - Criação/Atualização do Timer e do Score

Aluno 4 - Implementação de um algoritmo de ordenação no inventário e tela final do jogo 

# Pontos Extra
- Usar sprites para representar as células, jogador e itens.
- Criar um menu de pausa para o jogo, que pausa o tempo e mostra o inventário atual (sem ordenação).
- Criar um menu inicial que permita escolher o tamanho do grid, iniciar o jogo ou sair (fechar o programa)
