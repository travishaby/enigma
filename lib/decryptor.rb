require './lib/encryptor'

class Decryptor

  def encryptor
    e = Encryptor.new
  end

  def decrypt(character, final_rotation)
    ciphered = encryptor.cipher(-final_rotation)[character]
  end

  #NEED TO FIGURE OUT HOW TO MANUALLY PASS IN A KEY INSTEAD OF 
  #USING THE CHAIN THAT MAKES A KEY FROM THE TIME ITS SENT
  def decrypt_everythang(incoming_strings)
    placeholder = []
    incoming_strings.each do |string|
      4.times do |num|
        placeholder << decrypt(string[num], encryptor.rotation_plus_offset(num))
      end
    end
    placeholder.join
  end

  def pass_in_key_manually(key)
    key
  end

end
