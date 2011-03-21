module Campfirer
  class Daemon
    def initialize
      unless File.exist?(File.expand_path(Settings.config_path))
        abort "No configuration file found in #{Settings.config_path}. Create one and try again."
      end
    end

    def run
      EventMachine.run do
        Listener.connect(Settings.stream_settings)
      end
    end
  end
end
