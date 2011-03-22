module Campfirer
  class CLI < Thor
    include Thor::Actions

    desc "start", "Startup the Campfirer daemon"
    method_option :daemonize, :aliases => "-d",
      :default => true, :type => :boolean, :banner => "true|false",
      :desc => "Defines if the bot will run as a daemon or attached to the terminal"
    def start
      sanity_check!
      command = options[:daemonize] ? "start" : "run"
      daemon_exec(command)
    end

    desc "stop", "Stop the Campfirer daemon"
    def stop
      daemon_exec("stop")
    end

    desc "create_config", "Create a sample config file in ~/.campfirer"
    def create_config
      template("cli/config.tt", "~/.campfirer")
      say "Go tweak ~/.campfirer"
    end

    def self.source_root
      File.dirname(__FILE__)
    end

    no_tasks do
      def sanity_check!
        unless File.exist?(File.expand_path(Settings.config_path))
          abort "No configuration file found in #{Settings.config_path}. Create one with `campfirer create_config` and try again."
        end
      end

      def daemon_exec(command)
        Daemons.run_proc("campfirer", {:ARGV => [command], :proc => daemon_proc}, &daemon_proc)
      end

      def daemon_proc
        lambda do
          Campfirer.run
        end
      end
    end
  end
end
