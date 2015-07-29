require './lib/cipher'

class Encrypt

  def initialize(text = "abcd", key = nil, date = nil)
    @text = text
    @key  = key
    @date = date
  end

  def encrypt
    cipher = Cipher.new(@key, @date)
    cipher.__crypt(@text)
  end

end

if __FILE__ == $0
  handle = File.open(ARGV[0], "r")
  input = handle.read
  handle.close
  encrypted = Encrypt.new(input, "00001", "100000").encrypt
  writer = File.open(ARGV[1], "w")
  writer.write(encrypted)
  writer.close
end
