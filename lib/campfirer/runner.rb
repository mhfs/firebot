module Campfirer
  class Runner
    COMMAND_MATCHER = /^!(\w+)/

    attr_accessor :message

    def self.execute(json_message)
      msg = JSON.parse(json_message)
      new(msg).run if msg["type"] == "TextMessage"
    end

    def initialize(message)
      @message = message
    end

    def run
      if message["body"] =~ COMMAND_MATCHER
        if Campfirer.plugins[$1]
          Campfirer.plugins[$1].run(plugin_message(message["body"], $1))
        else
          Campfire.speak("No plugin respond to #{$1}.")
        end
      end
    end

    private

    def plugin_message(full_message, prefix)
      full_message.gsub(/^!#{prefix}/, "")
    end
  end
end
