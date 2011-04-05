module Firebot
  class Listener < Twitter::JSONStream
    def self.connect(options = {})
      Campfire.join_room
      conn = super(options)

      conn.each_item do |message|
        Runner.execute(message)
      end

      conn.on_error do |message|
        #TODO improve error handling
        Campfire.leave_room
        EventMachine.stop
      end

      conn.on_max_reconnects do |timeout, retries|
        #TODO improve error handling
        EventMachine.stop
      end

      conn
    end

    def unbind
      Campfire.leave_room
    end
  end
end
