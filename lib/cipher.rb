require './lib/rotation'
require './lib/offset'

class Cipher

  def rotation_plus_offset(index)
    r = Rotation.new
    o = Offset.new
    both = r.rotation(index, index + 1) + o.offset(index)
  end

  def cipher(rotation)
    characters = ("a".."z").to_a + ("0".."9").to_a + (", .").chars
    rotated_chars = characters.rotate(rotation)
    pairs = characters.zip(rotated_chars)
    key = Hash[pairs]
  end

end
