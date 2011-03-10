require "fakeweb"
require "campfirer"
require "rspec/mocks"

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

FakeWeb.allow_net_connect = false

RSpec.configure do |config|
  config.before(:each) do
    Campfirer::Settings.stub!(:all).and_return({
      :account     => "test",
      :room_id     => "123",
      :path        => "/room/123/live.json",
      :token       => "12345",
      :stream_host => "127.0.0.1",
      :stream_port => 4321,
      :host        => "campfirenow.com"
    })
  end

  config.before(:each)   { FakeWeb.clean_registry }
end
