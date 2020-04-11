# frozen_string_literal: true

class InicialScreen < BaseScreen
  def initialize
    load_elements_from 'tela_inicial'
  end

  def visivel?
    find_by_element(meus_pedidos, 10)
    find_by_element(proximas_sessoes)
  end

  def acessar_menu_filmes
    find_by_element(menu_filmes).click
  end

  def acessar_menu_conta
    find_by_element(menu_minha_conta).click
  end
end
