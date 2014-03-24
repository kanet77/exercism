class Integer
  ROMAN_NUMERALS = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'  
  }

  def to_roman
    decimal = self
    roman_base = 1000
    result = ''
    while (decimal >= 1) do
      factor = decimal/roman_base
      result << Integer::multiple_of(factor, roman_base)
      decimal -= (factor*roman_base)
      roman_base /= 10
    end
    result
  end

private

  def self.multiple_of(factor, roman_base)
    case factor
    when 0
      ''
    when 1..3
      ROMAN_NUMERALS[roman_base]*factor
    when 4
      ROMAN_NUMERALS[roman_base]+ROMAN_NUMERALS[roman_base*5]
    when 5
      ROMAN_NUMERALS[roman_base*5]
    when 6..8
      ROMAN_NUMERALS[roman_base*5]+(ROMAN_NUMERALS[roman_base]*(factor-5))
    when 9
      ROMAN_NUMERALS[roman_base] + ROMAN_NUMERALS[roman_base*10]
    else
      raise "Nonsense! Factor is #{factor}. Should be in (0..9)."
    end
  end
end