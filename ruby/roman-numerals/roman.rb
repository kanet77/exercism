class Integer
  def to_roman
    digits_with_exp.each_with_object('') do |(digit,exponent),result|
      result << Integer::digit_to_roman(digit,exponent)
    end
  end

private

  def digits_with_exp
    digits = self.to_s
    positions = (digits.length - 1).downto(0)
    digits.chars.zip(positions)
  end

  ROMAN = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'  
  }

  def self.digit_to_roman(digit, exponent)
    power_of_ten = 10 ** exponent
    factor = digit.to_i
    case factor
      when 0      then ''
      when 1..3   then ROMAN[power_of_ten] * factor
      when 4      then ROMAN[power_of_ten] + ROMAN[power_of_ten * 5]
      when 5      then ROMAN[power_of_ten * 5]
      when 6..8   then ROMAN[power_of_ten * 5] + ( ROMAN[power_of_ten] * (factor - 5) )
      when 9      then ROMAN[power_of_ten] + ROMAN[power_of_ten * 10]
      else        raise "Nonsense! Factor is #{factor}. Should be in (0..9)."
    end
  end
end