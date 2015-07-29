require './lib/rotation'
require './lib/offset'
require 'pry'

class Cipher
  def initialize(key = nil, date = nil)
    @key = key
    @date = date
    @rotation = Rotation.new(key, date)
  end

  def encrypt(text)
    text.scan(/.{1,4}/).map do |fragment|
      rotate(fragment)
    end.join
  end

  private

  def rotate(string)
    string.chars.each_with_index.map do |character, index|
      rotated_chars_hash = rotate_chars(@rotation.final_rotation(index))
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
# class Cipher
#
#   def initialize(key = nil, date = nil)
#     @key = key
#     @date = date
#   end
#
#   def rotation_plus_offset(index)
#     r = Rotation.new(@key)
#     both = r.rotation(index, index + 1) + offset(index)
#   end
#
#   def rotate(text)
#
#   end
#
# end
