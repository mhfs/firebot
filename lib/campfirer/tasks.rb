require "campfirer"

namespace :campfirer do
  desc "run the bot"
  task :run do
    Campfirer::Daemon.run
  end
end
