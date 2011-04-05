require "spec_helper"

describe Firebot::Campfire do
  before do
    @join_uri  = "https://12345:x@test.campfirenow.com/room/123/join.json"
    @leave_uri = "https://12345:x@test.campfirenow.com/room/123/leave.json"
  end

  context ".join_room" do
    it "should reach the join room endpoint" do
      FakeWeb.register_uri(:post, @join_uri, :body => "", :status => ["200", "OK"])

      res = Firebot::Campfire.join_room
      res.status.should == 200
    end

    it "should raise an exception if connection doesn't succeed" do
      FakeWeb.register_uri(:post, @join_uri, :body => "", :status => ["401", "Unauthorized"])

      expect {
        Firebot::Campfire.join_room
      }.to raise_error(Firebot::UnauthorizedException)
    end
  end

  context ".leave_room" do
    it "should reach the leave room endpoint" do
      FakeWeb.register_uri(:post, @leave_uri, :body => "", :status => ["200", "OK"])

      res = Firebot::Campfire.leave_room
      res.status.should == 200
    end

    it "should raise an exception if connection doesn't succeed" do
      FakeWeb.register_uri(:post, @leave_uri, :body => "", :status => ["401", "Unauthorized"])

      expect {
        Firebot::Campfire.leave_room
      }.to raise_error(Firebot::UnauthorizedException)
    end
  end
end
