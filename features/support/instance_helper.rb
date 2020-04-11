# frozen_string_literal: true

# A module to abstract the instance of classes
module InstanceHelper
  def tela_inicial
    @inicio ||= InicialScreen.new
  end

  def tela_filmes
    @filmes ||= FilmesScreen.new
  end

  def tela_minha_conta
    @conta ||= MinhaContaScreen.new
  end

  def tela_login
    @login ||= LoginScreen.new
  end

  def tela_cadastro
    @cadastro ||= CadastroScreen.new
  end
end

World InstanceHelper
