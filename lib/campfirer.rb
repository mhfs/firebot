require "twitter/json_stream"
require "faraday"
require "daemons"
require "thor"
require "json"

require "campfirer/settings"
require "campfirer/exceptions"
require "campfirer/campfire"
require "campfirer/runner"
require "campfirer/listener"
require "campfirer/cli"
require "campfirer/version"
require "campfirer/plugin"

module Campfirer
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

require "campfirer/plugins/ping_pong"
