require './lib/rotation'
require './lib/offset'
require './lib/cipher'

class Encryptor
  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def encrypt(text)
    cipher = Cipher.new(@key, @date)
    cipher.rotate(text)
  end
end
#
# class Encryptor
#
#   def initialize(key = nil)
#     @key = key
#   end
#
#   def cipher
#     c = Cipher.new(@key)
#   end
#
#   def encrypt(character, final_rotation)
#     ciphered = cipher.cipher(final_rotation)[character]
#   end
#
#   def do_the_whole_shabang(incoming_strings)
#     placeholder = []
#     incoming_strings.each do |string|
#       4.times do |num|
#         placeholder << encrypt(string[num], cipher.rotation_plus_offset(num))
#       end
#     end
#     placeholder.join
#   end
#
# end
