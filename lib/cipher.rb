require './lib/rotation'
require 'pry'

class Cipher

  def initialize(key = nil, date = nil, direction = "+")
    @key = key
    @date = date
    @rotation = Rotation.new(key, date)
    @direction = direction
  end

  def __crypt(text)
    text.scan(/.{1,4}/).map do |fragment|
      rotate(fragment)
    end.join
  end

  def rotate(string)
    string.chars.each_with_index.map do |character, index|
      rotate_value = (@direction + @rotation.final_rotation(index).to_s).to_i
      rotated_chars_hash = rotate_chars(rotate_value)
      rotated_chars_hash[character]
    end
  end

  def rotate_chars(rotation)
    characters = ("a".."z").to_a + ("0".."9").to_a + (", .").chars
    rotated_chars = characters.rotate(rotation)
    pairs = characters.zip(rotated_chars)
    key = Hash[pairs]
  end

end
