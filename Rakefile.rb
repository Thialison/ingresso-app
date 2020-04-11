# frozen_string_literal: true

require 'bundler'
Bundler.require(:test)
require_relative 'features/support/utils'

include Utils

DEVICE_ALERT = 'No connected devices found!'
ANDROID_APP_ALERT = 'App not found'

task default: %w[test]

desc 'Android Automation'

task :android do
  devices_connected = `adb get-state 1>/dev/null 2>&1 && echo 1 || echo 0`
  raise DEVICE_ALERT if devices_connected.to_i.zero?
  raise ANDROID_APP_ALERT unless app_available?
  sh 'appium&'
  `cucumber`
end
