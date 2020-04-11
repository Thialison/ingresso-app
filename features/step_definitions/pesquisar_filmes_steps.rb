# frozen_string_literal: true

Dado("que estou na tela inicial do app") do
  tela_inicial.visivel?
end

Quando("acesso o menu de filmes") do
  tela_inicial.acessar_menu_filmes
  tela_filmes.visivel?
end

Quando("pesquiso pelo {string}") do |nome_filme|
  tela_filmes.clicar_filmes_em_breve
  tela_filmes.pesquisar_filme(nome_filme)
end

Quando("acesso suas informações") do
  tela_filmes.acessar_filme
end

Então("devo visualizar os detalhes do filme {string}, {string}, {string}") do |diretor, data_estreia, elenco|
  tela_filmes.validar_detalhes_filme(diretor, data_estreia, elenco)
end
