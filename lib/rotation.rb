require './lib/generator'

class Rotation

  def initialize(key = nil, date = nil)
    @generator = Generator.new(key, date)
  end

  def final_rotation(index)
    @generator.key[index..index + 1].to_i + @generator.offset[index].to_i
  end

end
