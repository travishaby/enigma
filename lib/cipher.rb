require './lib/rotation'
require './lib/offset'

class Cipher

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def rotation_plus_offset(index)
    r = Rotation.new(@key)
    o = Offset.new(@key)
    both = r.rotation(index, index + 1) + o.offset(index)
  end

  def cipher(rotation)
    characters = ("a".."z").to_a + ("0".."9").to_a + (", .").chars
    rotated_chars = characters.rotate(rotation)
    pairs = characters.zip(rotated_chars)
    key = Hash[pairs]
  end

  def date
    key_generator = KeyGenerator.new(@key, @date)
    key_generator.input_date
  end

  def generate_offsets
    date_squared = date.to_i**2
    date_squared.to_s[-4..-1]
  end

  def rotate(text)

  end

end
