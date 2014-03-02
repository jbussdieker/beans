RSpec.configure do |config|
  config.include Capybara::DSL, :type => :request

  Capybara.run_server = true
  Capybara.server_port = 3100
  Capybara.app_host = 'http://localhost:3100'
  Capybara.default_wait_time = 5

  Capybara.register_driver :chrome do |app|
    args = []
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :args => args)
  end

  Capybara.javascript_driver = :chrome
  Capybara.default_driver = :chrome
end
