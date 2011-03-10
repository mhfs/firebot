require "spec_helper"

describe Campfirer::Runner do
  it "should respond to execute" do
    Campfirer::Runner.should respond_to(:execute)
  end
end
