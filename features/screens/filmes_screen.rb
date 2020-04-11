# frozen_string_literal: true

class FilmesScreen < BaseScreen
  def initialize
    load_elements_from 'filmes'
  end

  def visivel?
    expect(wait_element_disappear(carregamento)).to be true
    find_by_element(pesquisar)
  end

  def clicar_filmes_em_breve
    find_exact(filmes_em_breve.values[0]).click
  end

  def acessar_filme
    pesquisar_filme
    find_by_element(nome_filme).click
  end

  def pesquisar_filme
    filmes = find_elements(lista_filmes)
    lista_filmes = filmes.map {|filme| filme.text }
    find_by_element(pesquisar).click
    @nome_filme = lista_filmes.shuffle.first
    find_by_element(buscar_filme).send_keys @nome_filme
  end

  def validar_info_filme
    expect(find_by_element(titulo_filme).text).to eq @nome_filme
  end
end
