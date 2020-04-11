# frozen_string_literal: true

Dado('que estou na tela minha conta') do
  tela_inicial.visivel?
  tela_inicial.acessar_menu_conta
  tela_minha_conta.visivel?
end

Quando('acesso a tela de cadastro') do
  tela_minha_conta.acessar_entrar
  tela_login.visivel?
end

Quando('preencho meus o cadastro com dados válidos') do
  tela_login.criar_conta
  tela_cadastro.visivel?
  tela_cadastro.preencher_dados_validos
end

Então('devo ser cadastrado com sucesso') do
  tela_cadastro.cadastro_realizado_com_sucesso?
end
