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

  def pesquisar_filme(nome_filme)
    find_by_element(pesquisar).click
    find_by_element(buscar_filme).send_keys nome_filme
  end

  def acessar_filme
    find_by_element(nome_filme).click
  end

  def validar_detalhes_filme(diretor, data_estreia, elenco)
    expect(find_by_element(nome_diretor).text).to eq diretor
    expect(find_by_element(texto_data_estreia).text).to eq data_estreia
    expect(find_by_element(conteudo_elenco).text).to eq elenco
  end
end
