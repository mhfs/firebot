require "spec_helper"

describe Campfirer::Daemon do
  it "should complain if config file is not in place" do
    swap Campfirer::Settings, :config_path => "path/to/nowhere" do
      lambda { Campfirer::Daemon.new }.should raise_error(SystemExit)
    end
  end

  it "should initialize daemon without problemns if settings path is correct" do
    lambda { Campfirer::Daemon.new }.should_not raise_error
  end
end
