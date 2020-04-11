# frozen_string_literal: true

Before do |scenario|
  @num = 0
  scenario_tags = scenario.source_tag_names
  @scenario = scenario.name.tr(' ', '_').downcase

  Appium::Driver.new(CAPS, true)
  Appium.promote_appium_methods Object
  Selenium::WebDriver.logger.level = :error

  caps[:name] = scenario.name

  if scenario_tags.include?('@reset')
    caps[:fullReset] = false
    caps[:noReset] = false
  else
    caps[:noReset] = true
    caps[:fullReset] = false
  end

  driver.start_driver
end

AfterStep do |scenario|
  @num += 1
  screenshot("./report/#{@num}_#{@scenario}_#{ENV['PLATFORM']}.png")
  embed("./report/#{@num}_#{@scenario}_#{ENV['PLATFORM']}.png", 'image/png')
end

After do |scenario|
  driver.driver_quit
end
