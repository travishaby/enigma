require './lib/cipher'

class Decrypt

  def initialize(text = "abcd", key = nil, date = nil)
    @text = text
    @key = key
    @date = date
  end

  def decrypt
    cipher = Cipher.new(@key, @date, "-")
    cipher.__crypt(@text)
  end
  
end

if __FILE__ == $0
  handle = File.open(ARGV[0], "r")
  input = handle.read
  handle.close
  decrypted = Decrypt.new(input, ARGV[2], ARGV[3]).decrypt
  writer = File.open(ARGV[1], "w")
  writer.write(decrypted)
  writer.close
end
