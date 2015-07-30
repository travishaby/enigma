require './lib/decrypt'

class Cracker
  attr_reader :rot_a,
              :rot_b,
              :rot_c,
              :rot_d,
              :text,
              :end_string

  def initialize(text = "abcd", date = nil)
    @text = text
    @date = date
    @end_string = "..end.."
  end

  def remainder
    @text.length % 4
  end

  def save_remainder
    if remainder == 0
      ""
    else
      save_extra = @text[-remainder..-1]
    end
    save_extra
  end

  def remove_remainder
    remainder.times {
                    @text       = @text.chop
                    @end_string = @end_string.chop
                    }
  end

  def find_rotation
    @rot_a = find_distance(@end_string[-4], @text[-4])
    @rot_b = find_distance(@end_string[-3], @text[-3])
    @rot_c = find_distance(@end_string[-2], @text[-2])
    @rot_d = find_distance(@end_string[-1], @text[-1])
  end

  def decrypt
    @text = @text.scan(/.{1,4}/).map do |fragment|
      rotate(fragment)
    end.join
    @text += save_remainder
  end

  def rotate(string)
    rotations = [@rot_a, @rot_b, @rot_c, @rot_d]
    string.chars.each_with_index.map do |character, index|
      rotated_chars_hash = rotate_chars(-rotations[index])
      rotated_chars_hash[character]
    end
  end

  def rotate_chars(rotation)
    characters = ("a".."z").to_a + ("0".."9").to_a + (", .").chars
    rotated_chars = characters.rotate(rotation)
    pairs = characters.zip(rotated_chars)
    key = Hash[pairs]
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

end

if __FILE__ == $0
  handle = File.open(ARGV[0], "r")
  input = handle.read
  handle.close
  cracked = Cracker.new(input, ARGV[2])
  cracked.remove_remainder
  cracked.find_rotation
  cracked = cracked.decrypt
  writer = File.open(ARGV[1], "w")
  writer.write(cracked)
  writer.close
end
