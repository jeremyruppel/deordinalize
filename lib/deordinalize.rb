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
  
  
  def deordinalize
    
    sum = 0
    
    if tens = self[TENS_MATCH, 1]
      sum = TENS[tens]
      self.sub! "#{tens}-", ''
    end
    
    # TODO try refactoring this block out into its own method
    if explicit = EXPLICITS[self]
      sum + explicit
    elsif regular = self[/^(.+)teenth$/, 1]
      10 + REGULARS[regular]
    elsif regular = self[/^(.+)th$/, 1]
      sum + REGULARS[ regular ]
    end
    
  end
  
end

String.send :include, Deordinalize