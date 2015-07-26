require './lib/rotation'
require './lib/offset'
require './lib/cipher'

class Encryptor

  attr_accessor :key

  def cipher
    c = Cipher.new
  end

  def encrypt(character, final_rotation)
    ciphered = cipher.cipher(final_rotation)[character]
  end

  def do_the_whole_shabang(incoming_strings)
    placeholder = []
    incoming_strings.each do |string|
      4.times do |num|
        placeholder << encrypt(string[num], cipher.rotation_plus_offset(num))
      end
    end
    placeholder.join
  end

end
