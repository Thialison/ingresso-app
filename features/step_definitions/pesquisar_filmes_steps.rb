# frozen_string_literal: true

Dado('que estou na tela inicial do app') do
  tela_inicial.visivel?
end

Quando('acesso o menu de filmes') do
  tela_inicial.acessar_menu_filmes
  tela_filmes.visivel?
end

Quando("pesquiso por um filme da lista") do
  tela_filmes.clicar_filmes_em_breve
end

Quando("acesso o filme") do
  tela_filmes.acessar_filme
end

Então("devo visualizar suas informações") do
  tela_filmes.validar_info_filme
end
