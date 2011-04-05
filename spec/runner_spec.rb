require "spec_helper"

describe Firebot::Runner do
  it "should respond to execute" do
    Firebot::Runner.should respond_to(:execute)
  end
end
