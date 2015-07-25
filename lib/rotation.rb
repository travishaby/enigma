require './lib/key_generator'

class Rotation

  def rotation_parser(start, stop)
    kg = KeyGenerator.new
    kg.generate_key[start..stop]
  end

  def rot_a
    rotation_parser(0, 1).to_i
  end

  def rot_b
    rotation_parser(1, 2).to_i
  end

  def rot_c
    rotation_parser(2, 3).to_i
  end

  def rot_d
    rotation_parser(3, 4).to_i
  end



end
