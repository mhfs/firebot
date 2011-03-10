require "spec_helper"

describe Campfirer::Settings do
  context ".all" do
    it "should return hash" do
      Campfirer::Settings.all.should be_instance_of(Hash)
    end
  end

  context ".[]" do
    it "should return setting key" do
      Campfirer::Settings[:host].should == "campfirenow.com"
      Campfirer::Settings[:room_id].should == "123"
    end
  end
end
