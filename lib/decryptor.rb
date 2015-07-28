require './lib/encryptor'

class Decryptor

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def cipher
    c = Cipher.new(@key, @date)
  end

  def decrypt(character, final_rotation)
    ciphered = cipher.cipher(-final_rotation)[character]
  end

  #NEED TO FIGURE OUT HOW TO MANUALLY PASS IN A KEY INSTEAD OF
  #USING THE CHAIN THAT MAKES A KEY FROM THE TIME ITS SENT
  def decrypt_everythang(incoming_strings)
    placeholder = []
    incoming_strings.each do |string|
      4.times do |num|
        placeholder << decrypt(string[num], cipher.rotation_plus_offset(num))
      end
    end
    placeholder.join
  end

end
