module Deordinalize
  
  
  EXPLICITS = {
    'first'     => 1,
    'second'    => 2,
    'third'     => 3,
    'ninth'     => 9,
    'eleventh'  => 11,
    'twelfth'   => 12,
    'twentieth' => 20
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
  
  
  def deordinalize
    
    if explicit = EXPLICITS[self]
      explicit
    elsif regular = self[/^(.+)teenth$/, 1]
      10 + REGULARS[regular]
    elsif regular = self[/^(.+)th$/, 1]
      REGULARS[ regular ]
    end
    
  end
  
end

String.send :include, Deordinalize