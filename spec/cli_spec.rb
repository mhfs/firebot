require "spec_helper"

describe Firebot::CLI do
  context "#sanity_check!" do
    it "should complain if config file is not in place" do
      swap Firebot::Settings, :config_path => "path/to/nowhere" do
        lambda do
          cli = Firebot::CLI.new
          cli.sanity_check!
        end.should raise_error(SystemExit)
      end
    end

    it "should let execution if settings path is correct" do
      lambda do
        cli = Firebot::CLI.new
        cli.sanity_check!
      end.should_not raise_error
    end
  end
end
