require './lib/rotation'
require './lib/cipher'

class Encryptor
  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def encrypt(text)
    cipher = Cipher.new(@key, @date)
    cipher.__crypt(text)
  end
end
