class JSONServer < EM::Connection
  SAMPLE_DATA = File.read(File.expand_path("../../fixtures/sample_response.txt", __FILE__))

  def receive_data(data)
    send_data(SAMPLE_DATA)
  end
end

def consume_stream
  host = "127.0.0.1"
  port = 4321
  EM.run {
    EM.start_server host, port, JSONServer
    Campfirer::Listener.connect(Campfirer::Settings.all)
    EM.add_timer(0.01){ EM.stop }
  }
end
