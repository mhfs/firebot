module Campfirer
  module Settings
    def self.all
      @settings ||= YAML.load(File.read(config_path)).to_hash
    end

    def self.[](key)
      all[key.to_s]
    end

    def self.config_path
      @config_path ||= "~/.campfirer"
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
