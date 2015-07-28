require './lib/key_generator'

class Offset

  def initialize(key = nil)
    @key = key
  end

  def offset_parser(number)
    key = @key
    kg = KeyGenerator.new(key)
    kg.generate_offset[number].to_i
  end

  def offset(number)
    offset_parser(number)
  end

end
