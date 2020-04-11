# frozen_string_literal: true

class LoginScreen < BaseScreen
  def initialize
    load_elements_from 'login'
  end

  def visivel?
    find_by_element(logo_ingresso)
  end

  def criar_conta
    find_by_element(botao_criar_conta).click
  end
end
