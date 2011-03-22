require "twitter/json_stream"
require "faraday"
require "daemons"
require "thor"

require "campfirer/settings"
require "campfirer/exceptions"
require "campfirer/campfire"
require "campfirer/runner"
require "campfirer/listener"
require "campfirer/cli"
require "campfirer/version"

module Campfirer
  def self.run
    EventMachine.run do
      Listener.connect(Settings.stream_settings)
    end
  end
end
