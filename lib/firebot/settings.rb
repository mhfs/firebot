module Firebot
  module Settings
    def self.all
      @settings ||= begin
        options = {
          "stream_host" => "streaming.campfirenow.com",
          "stream_port" => "80",
          "host"        => "campfirenow.com"
        }
        user_options = YAML.load(File.read(File.expand_path(config_path))).to_hash
        options.merge!(user_options)
        options["path"] = "/room/#{options["room_id"]}/live.json"
        options
      end
    end

    def self.[](key)
      all[key.to_s]
    end

    def self.config_path
      @config_path ||= "~/.firebot"
    end

    def self.config_path=(path)
      @config_path = path
    end

    def self.stream_settings
      {
        :path => "/room/#{self[:room_id]}/live.json",
        :host => self[:stream_host],
        :port => self[:stream_port],
        :auth => "#{self[:token]}:x"
      }
    end
  end
end
