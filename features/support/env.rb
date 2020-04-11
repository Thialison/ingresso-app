# frozen_string_literal: true

require 'bundler'
Bundler.require(:test)
require_relative 'utils'

include Utils

ENV['PLATFORM'] = 'android'
ENV['DEVICE'] = 'Moto G' unless ENV.key? 'DEVICE'
ENV['APP'] = app_path
DATA = YAML.load_file('./data/data_management.yml')

CAPS = YAML.safe_load(
  ERB.new(File.read('config/capabilities.yml')).result
)[ENV['PLATFORM']]
