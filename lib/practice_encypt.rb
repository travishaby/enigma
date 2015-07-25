class Encryptor

  def encrypt(input, rotation)
    letters = input.chars
    ciphered = letters.collect do |char|
        cipher(rotation)[char]
    end
    ciphered.join
  end

  def decrypt(input, rotation)
    letters = input.chars
    deciphered = letters.collect do |char|
        cipher(-rotation)[char]
    end
    deciphered.join
  end

  def cipher(rotation)
    characters = (" ".."z").to_a
    rotated_chars = (" ".."z").to_a.rotate(rotation)
    pairs = characters.zip(rotated_chars)
    key = Hash[pairs]
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message, attempt)
    end
  end

end
