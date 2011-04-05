require "spec_helper"

describe Firebot::Listener do
  before do
    @join_uri  = "https://12345:x@test.campfirenow.com/room/123/join.json"
    @leave_uri = "https://12345:x@test.campfirenow.com/room/123/leave.json"

    FakeWeb.register_uri(:post, @join_uri, :body => "", :status => ["200", "OK"])
    FakeWeb.register_uri(:post, @leave_uri, :body => "", :status => ["200", "OK"])
  end

  it "should listen do stream and trigger command execution" do
    message_content = '{"room_id":123,"created_at":"2011/03/10 03:07:51 +0000","body":"nice message","id":322347135,"user_id":321,"type":"TextMessage"}'
    Firebot::Runner.should_receive(:execute).with(message_content).twice

    consume_stream
  end
end
