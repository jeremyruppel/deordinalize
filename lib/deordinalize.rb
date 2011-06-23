module Deordinalize
  # Your code goes here...
  
  def deordinalize
    
    case self.downcase
    when "first"
      0
    when "second"
      1
    when "third"
      2
    when "fourth"
      3
    when "fifth"
      4
    end
    
  end
  
end

String.send :include, Deordinalize