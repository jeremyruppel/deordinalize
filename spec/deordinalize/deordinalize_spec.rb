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
  
  Linguistics.use :en
  
  cases = (1..20).to_a
  
  cases.map { |i| [ i.en.ordinal, i ] }.each do |ordinal, number|
    # puts ordinal
    # puts number
  end
  
  cases.map { |i| [ i.en.numwords.en.ordinal, i ] }.each do |ordinal, number|
    it "should deordinalize '#{ordinal}' to #{number}" do
      ordinal.deordinalize.should == number
    end
  end
  
  
    # 
    # .each_with_index do |ordinal, index|
    #   

    #   
    # end
end