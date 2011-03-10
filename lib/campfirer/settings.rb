module Campfirer
  class Settings
    # FIXME this is a temporary test solution until I move it to a config file
    OPTIONS = {
      :account     => "mhfs",
      :room_id     => "355045",
      :path        => "/room/355045/live.json",
      :token       => "507f768a751c2271d0c5459f8bb32b157fe4ec40", # dummy user locked into test room
      :stream_host => "streaming.campfirenow.com",
      :stream_port => 80,
      :host        => "campfirenow.com"
    }

    def self.all
      OPTIONS
    end

    def self.[](key)
      all[key]
    end
  end
end
