require 'selenium-webdriver'
require 'capybara'
require 'capybara/rspec'
require 'allure-rspec'
require 'logger'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include AllureRSpec::Adaptor
  config.include Capybara::DSL

  config.after :each do |e|
    temp_file = '/log/reports/screenshots/temp_file.png'

    take_screenshot = File.new(page.save_screenshot(File.join(Dir.pwd, temp_file)))

    e.attach_file('screenshot', take_screenshot) # if e.exception
  end
end

# Capybara.javascript_driver = :selenium
# Capybara.run_server = false

# args = ['--no-default-browser-check']
# caps = Selenium::WebDriver::Remote::Capabilities.chrome(
#   'chromeOptions' => { 'args' => args }
# )
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :remote,
#     url: 'http://selenium_server:4444/wd/hub',
#     desired_capabilities: caps
#   )
# end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless
  config.app_host = 'https://www.dotz.com.br'
end

Capybara.default_max_wait_time = 10

AllureRSpec.configure do |c|
  c.output_dir = 'log/reports'
  c.clean_dir = true
  c.logging_level = Logger::WARN
end
