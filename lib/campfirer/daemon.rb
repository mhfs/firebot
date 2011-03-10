module Campfirer
  class Daemon
    def self.run
      EventMachine.run do
        Listener.connect(Settings.all)
      end
    end
  end
end
