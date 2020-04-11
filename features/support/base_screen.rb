# frozen_string_literal: true

# A place to play methods as you want
class BaseScreen
  include RSpec::Matchers

  def find_by_element(element, timeout = 5)
    wait(timeout) { find_element(element) }
  rescue StandardError
    raise "Elemento <<#{element}>> não está presente na tela"
  end

  def element_exists?(element, timeout = 5)
    wait(timeout) { find_element(element) }
    true
  rescue StandardError
    false
  end

  def wait_element_disappear(el)
    wait_true { !element_exists?(el, 1) }
  end

  def load_elements_from(screen)
    yml = YAML.load_file("./features/elements/#{screen}.yml")[ENV['PLATFORM']]
    JSON.parse(JSON.dump(yml), symbolize_names: true).each do |key, value|
      define_singleton_method key, -> { value }
    end
  end
end
