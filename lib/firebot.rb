require "twitter/json_stream"
require "faraday"
require "daemons"
require "thor"
require "json"

require "firebot/settings"
require "firebot/exceptions"
require "firebot/campfire"
require "firebot/runner"
require "firebot/listener"
require "firebot/cli"
require "firebot/version"
require "firebot/plugin"

module Firebot
  def self.run
    EventMachine.run do
      Listener.connect(Settings.stream_settings)
    end
  end

  def self.register_plugin(identifier, handler)
    @plugins ||= {}
    @plugins[identifier.to_s] = handler.new
  end

  def self.plugins
    @plugins
  end
end

require "firebot/plugins/ping_pong"
