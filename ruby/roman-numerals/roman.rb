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
    digits = self.to_s.chars.to_i
    digits_with_exp = digits.reverse.each_with_index.to_h.sort_by { |k,v| v }.reverse!
    digits_with_exp = digits.reverse.each_with_index { |d,i| i,d }.reverse!
    roman = digits.map(multiple_of)
    # decimal = self
    # power_of_ten = ROMAN_NUMERALS.first
    # result = ''
    # while (decimal >= 1) do
    #   factor = decimal/power_of_ten
    #   result << Integer::multiple_of(factor, power_of_ten)
    #   decimal -= (factor * power_of_ten)
    #   power_of_ten /= 10
    # end
    # result
  end

private

  def self.multiple_of(factor, exponent)
    power_of_ten = 10 ** exponent
    case factor.to_i
    when 0
      ''
    when 1..3
      ROMAN_NUMERALS[power_of_ten] * factor
    when 4
      ROMAN_NUMERALS[power_of_ten] + ROMAN_NUMERALS[power_of_ten * 5]
    when 5
      ROMAN_NUMERALS[power_of_ten * 5]
    when 6..8
      ROMAN_NUMERALS[power_of_ten * 5] + ( ROMAN_NUMERALS[power_of_ten] * (factor - 5) )
    when 9
      ROMAN_NUMERALS[power_of_ten] + ROMAN_NUMERALS[power_of_ten * 10]
    else
      raise "Nonsense! Factor is #{factor}. Should be in (0..9)."
    end
  end
end