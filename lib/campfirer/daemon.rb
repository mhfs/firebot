module Campfirer
  class Daemon
    def self.run
      EventMachine.run do
        Listener.connect(Settings.stream_settings)
      end
    end
  end
end
