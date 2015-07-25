require './lib/key_generator'

class Rotation

  def rotation_parser(start, stop)
    kg = KeyGenerator.new
    kg.generate_key[start..stop]
  end

  def rotation(number1, number2)
    rotation_parser(number1, number2).to_i
  end

end
