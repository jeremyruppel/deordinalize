require 'spec_helper'

describe "deordinalizing a string" do
  
  it "should define deordinalize" do
    "hello".should respond_to(:deordinalize)
  end
end