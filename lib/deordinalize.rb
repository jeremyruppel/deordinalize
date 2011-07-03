module Deordinalize
  
  EXPLICITS = {
    'first'         => 1,
    'second'        => 2,
    'third'         => 3,
    'ninth'         => 9,
    'eleventh'      => 11,
    'twelfth'       => 12,
    'twentieth'     => 20,
    'thirtieth'     => 30,
    'fortieth'      => 40,
    'fiftieth'      => 50,
    'sixtieth'      => 60,
    'seventieth'    => 70,
    'eightieth'     => 80,
    'ninetieth'     => 90,
    'one hundredth' => 100
  }
  
  REGULARS = {
    'thir'  => 3,
    'four'  => 4,
    'fif'   => 5,
    'six'   => 6,
    'seven' => 7,
    'eigh'  => 8,
    'nine'  => 9,
    'ten'   => 10
  }
  
  TENS = {
    'twenty'  => 20,
    'thirty'  => 30,
    'forty'   => 40,
    'fifty'   => 50,
    'sixty'   => 60,
    'seventy' => 70,
    'eighty'  => 80,
    'ninety'  => 90
  }
  
  TENS_MATCH = /(#{TENS.keys.join '|'})-/
  
  ORDINAL = /^(\d+)(?:st|nd|rd|th)$/
  
  def deordinalize
    
    sum = 0
    
    # if we have a tens prefix, assign it to the sum and remove it from our self
    if tens = self[TENS_MATCH, 1]
      sum = TENS[tens]
      self.sub! "#{tens}-", ''
    end
    
    # TODO try refactoring this block out into its own method
    
    # if we have a numeric ordinal, pretty much just need to strip out the number
    if ordinal = self[ORDINAL, 1]
      ordinal.to_i
      
    # if we have an explicit ordinal, find it in the map
    elsif explicit = EXPLICITS[self]
      sum + explicit
      
    # if we have a teen, find the regular prefix and add ten
    elsif regular = self[/^(.+)teenth$/, 1]
      10 + REGULARS[regular]
    
    # if we have a regular prefix, add it to the sum
    elsif regular = self[/^(.+)th$/, 1]
      sum + REGULARS[ regular ]
    end
    
  end
  
  def deordinalize!
    self.deordinalize - 1
  end
  
end

String.send :include, Deordinalize