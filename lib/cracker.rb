class Cracker

  def initialize(text = "abcd")
    @key = key
    @date = date
  end

  def crack(message)

  end

  def find_distance(known_char, encrypted_char)
    characters = ("a".."z").to_a + ("0".."9").to_a + (", .").chars
    start = characters.index(known_char)
    counter = 0
    until characters[start] == encrypted_char
      characters = characters.rotate
      counter += 1
    end
    counter
  end

  def find_modulo_four(message)
    remainder = message % 4
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message, attempt)
    end
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
