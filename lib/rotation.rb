require './lib/key_generator'

class Rotation
  def initialize(key = nil, date = nil)
    @key_generator = KeyGenerator.new(key, date)
  end

  def final_rotation(index)
    @key_generator.key[index..index + 1].to_i + @key_generator.offset[index].to_i
  end

end

# class Rotation
#
#   attr_accessor :key
#
#   def initialize(key = nil)
#     @key = key
#   end
#
#
#   def rotation_parser(start, stop)
#     kg = KeyGenerator.new(@key)
#     kg.generate_key[start..stop]
#   end
#
#   def rotation(number1, number2)
#     rotation_parser(number1, number2).to_i
#   end
#
#   def offset(number)
#     generate_offsets[number].to_i
#   end
#
# end
