require './lib/key_generator'

class Offset

  def offset_parser(number)
    kg = KeyGenerator.new
    kg.generate_offset[number].to_i
  end

  def off_a
    offset_parser(0)
  end

  def off_b
    offset_parser(1)
  end

  def off_c
    offset_parser(2)
  end

  def off_d
    offset_parser(3)
  end
end
