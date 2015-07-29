class Cracker

  def initialize(key = nil, date = nil)
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

  def last_seven_chars(message)
    message[-7..-1]
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message, attempt)
    end
  end
  
end
