require './lib/key_generator'

class Offset

  def offset_parser(number)
    kg = KeyGenerator.new
    kg.generate_offset[number].to_i
  end

  def offset(number)
    offset_parser(number)
  end

end
