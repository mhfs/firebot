require "firebot"

namespace :firebot do
  desc "run the bot"
  task :run do
    Firebot::Daemon.run
  end
end
