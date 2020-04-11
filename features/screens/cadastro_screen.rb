# frozen_string_literal: true

class CadastroScreen < BaseScreen
  def initialize
    load_elements_from 'cadastro'
  end

  def visivel?
    expect(wait_element_disappear(carregamento)).to be true
  end

  def preencher_dados_validos
    edit_texts = find_elements(campos_cadastro)
    preenche_basico_info(edit_texts)
    escolher_genero
    edit_texts[4].send_keys CPF.generate
    edit_texts[5].send_keys '011'
    edit_texts[6].send_keys Faker::PhoneNumber.cell_phone
    preenche_endereco(edit_texts)
    find_elements(privacy_check)[1].click
    find_by_element(continuar_btn).click
  end

  def preenche_basico_info(campos)
    campos[0].send_keys Faker::DcComics.hero
    campos[1].send_keys Faker::Internet.email
    campos[2].send_keys Faker::Lorem.word
    campos[3].send_keys gera_data
  end

  def escolher_genero
    genero = rand(1..2)
    find_by_element(select_genero).click
    find_elements(checks_genero)[genero].click
  end

  def preenche_endereco(campos)
    campos[7].send_keys '05425020'
    find_by_element(cep_ok).click
    deslizar_para_baixo
    campos[9].send_keys rand(1..999)
  end

  def gera_data
    ano = rand(1970..2001)
    data = Date.strptime("13-10-#{ano}", '%d-%m-%Y')
    data_formatada = "#{data.day}/#{data.month}/#{data.year}"
  end

  def deslizar_para_baixo
    cords = window_size
    swipe(start_x: cords.width / 2, start_y: cords.height * 0.6, end_x: cords.width / 2, end_y: cords.height * 0.4)
    swipe(start_x: cords.width / 2, start_y: cords.height * 0.6, end_x: cords.width / 2, end_y: cords.height * 0.4)
  end

  def cadastro_realizado_com_sucesso?
    find_by_element(painel_finalizacao_cadastro)
    expect(find_by_element(texto_cadastro_pronto).text).to eq 'Pronto!'
  end
end
