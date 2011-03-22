module Campfirer
  module Campfire
    def self.join_room
      post :join
    end

    def self.leave_room
      post :leave
    end

    def self.speak(message)
      post :speak, {:message => {:body => message, :type => "TextMessage"}}
    end

    private

    def self.connection
      @connection ||= Faraday.new(:url => account_host) do |builder|
        builder.use Faraday::Request::Yajl
        builder.adapter Faraday.default_adapter
        builder.headers['Content-Type'] = 'application/json'
        builder.basic_auth Settings[:token], "x"
      end
    end

    def self.post(action, body = nil)
      res = connection.post "/room/#{Settings[:room_id]}/#{action}.json", body
      raise UnauthorizedException if res.status == 401
      res
    end

    def self.account_host
      "https://#{Settings[:account]}.#{Settings[:host]}"
    end
  end
end
