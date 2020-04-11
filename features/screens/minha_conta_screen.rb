# frozen_string_literal: true

class MinhaContaScreen < BaseScreen
  def initialize
    load_elements_from 'minha_conta'
  end

  def visivel?
    find_by_element(toolbar_minha_conta)
  end

  def acessar_entrar
    find_by_element(criar_conta_entrar).click
  end
end
