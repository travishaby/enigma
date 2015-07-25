require './lib/rotation'
require './lib/offset'

class Encryptor

  #rotation and offset are determined by which place in the 4 letter sequence we are encrypting
  def rotation_plus_offset(index)
    r = Rotation.new
    o = Offset.new
    both = r.rotation(index, index + 1) + o.offset(index)
  end

  def encrypt(character, final_rotation)
    ciphered = cipher(final_rotation)[character]
  end

  def cipher(rotation)
    characters = ("a".."z").to_a + ("0".."9").to_a + (", .").chars
    rotated_chars = characters.rotate(rotation)
    pairs = characters.zip(rotated_chars)
    key = Hash[pairs]
  end

  def do_the_whole_shabang(incoming_strings)
    placeholder = []
    incoming_strings.each do |string|
      4.times do |num|
        placeholder << encrypt(string[num], rotation_plus_offset(num))
      end
    end
    placeholder.join
  end

end
