module Firebot
  class PingPong < Plugin
    trigger :pp
    command :ping, /ping/
    command :pong, /pong/

    def help
      "Usage: !pp ping or !pp pong"
    end

    def ping
      reply("pong")
    end

    def pong
      reply("ping")
    end
  end
end
