#language: pt

Funcionalidade: Pesquisar filmes

Como usuário do app ingresso.com
Quero ser capaz de pesquisar filmes
Para visualizar suas informações

Contexto: Abrir tela inicial do App
  Dado que estou na tela inicial do app

@pesquisar
Cenário: Pesquisar por filmes em Breve
 Quando acesso o menu de filmes
 E pesquiso por um filme da lista
 E acesso o filme
 Então devo visualizar suas informações

@pesquisar @bdd
Esquema do Cenário: Pesquisar por um filme em Breve
 Quando acesso o menu de filmes
 E pesquiso pelo "<nome_filme>"
 E acesso suas informações
 Então devo visualizar os detalhes do filme "<diretor>", "<data_estreia>", "<elenco>"

Exemplos:
 | nome_filme  |   diretor    |   data_estreia   |                  elenco                     |
 | Marighella  | Wagner Moura | ESTREIA 07/12/20 | Seu Jorge, Adriana Esteves, Bruno Gagliasso |