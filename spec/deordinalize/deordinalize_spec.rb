require 'spec_helper'

describe "a string" do
  it "should respond to deordinalize" do
    "hello".should respond_to(:deordinalize)
  end
  
  context "when not an ordinal" do
    it "should return nil" do
      "hello".deordinalize.should be_nil
    end
  end
  
  %w|
  
  first
  second
  third
  fourth
  fifth
  
  |.each_with_index do |ordinal, index|
    
    it "should deordinalize '#{ordinal}' to #{index}" do
      ordinal.deordinalize.should == index
    end
    
  end
end