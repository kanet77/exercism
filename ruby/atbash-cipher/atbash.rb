class Atbash
  def self.encode(plain)
    cleaned = plain.scan(/[\w\d]/).join.downcase
    translated = cleaned.tr('abcdefghijklmnopqrstuvwxyz', 'zyxwvutsrqponmlkjihgfedcba')
    encoded = ''
    translated.chars.each_slice(5) { |word|
      encoded << word.join << ' '
    }
    encoded[0..-2]
  end
end