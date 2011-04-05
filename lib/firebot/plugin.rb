module Firebot
  class Plugin
    class << self
      attr_accessor :commands
    end

    def self.trigger(identifier)
      Firebot.register_plugin(identifier, self)
    end

    def self.command(command, regex)
      @commands ||= {}
      @commands[regex] = command
    end

    def run(cmd)
      cmd.strip!
      matched = false
      self.class.commands.each do |regex, method|
        if cmd =~ regex
          send(method)
          matched = true
        end
      end
      reply(help) unless matched
    end

    def help
      raise NotImplementedError
    end

    def reply(message)
      Campfire.speak(message)
    end
  end
end
