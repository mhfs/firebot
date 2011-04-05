require "spec_helper"

describe Firebot::Settings do
  context ".all" do
    it "should return hash" do
      Firebot::Settings.all.should be_instance_of(Hash)
    end
  end

  context ".[]" do
    it "should return setting key" do
      Firebot::Settings[:host].should == "campfirenow.com"
      Firebot::Settings[:room_id].should == "123"
    end
  end
end
