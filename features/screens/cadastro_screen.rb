# frozen_string_literal: true

class CadastroScreen < BaseScreen
  def initialize
    load_elements_from 'cadastro'
  end

  def visivel?
    expect(wait_element_disappear(carregamento)).to be true
  end

  def preencher_dados_validos
    edit_texts = find_elements(:class_name, 'android.widget.EditText')
    edit_texts[0].send_keys Faker::DcComics.hero
    edit_texts[1].send_keys Faker::Internet.email
    edit_texts[2].send_keys 'password@1'
    edit_texts[3].send_keys '12/03/1990'
    find_element(:class_name, 'android.widget.Spinner').click
    find_elements(:class_name, 'android.widget.CheckedTextView')[1].click
    edit_texts[4].send_keys CPF.generate
    edit_texts[5].send_keys '011'
    edit_texts[6].send_keys Faker::PhoneNumber.cell_phone
    edit_texts[7].send_keys '05425020'
    find_element(:class_name, 'android.widget.Button').click
    deslizar_para_baixo
    find_elements(:class_name, 'android.widget.CheckBox')[1].click
    edit_texts[9].send_keys rand(1..999)
    find_element(:class_name, 'android.widget.Button').click
    byebug
  end

  def deslizar_para_baixo
    cords = window_size
    swipe(start_x: cords.width / 2, start_y: cords.height * 0.6, end_x: cords.width / 2, end_y: cords.height * 0.4)
    swipe(start_x: cords.width / 2, start_y: cords.height * 0.6, end_x: cords.width / 2, end_y: cords.height * 0.4)
  end

  def cadastro_realizad_com_sucesso?
    find_by_element(painel_finalizacao_cadastro)
    expect(find_element(:class_name, 'android.widget.TextView').text).to eq 'Pronto!'
  end
end
