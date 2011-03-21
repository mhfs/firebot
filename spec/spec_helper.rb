require "fakeweb"
require "campfirer"
require "rspec/mocks"

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

FakeWeb.allow_net_connect = false

Campfirer::Settings.config_path = File.expand_path("spec/fixtures/config.yml")

RSpec.configure do |config|
  config.before(:each)   { FakeWeb.clean_registry }
end
