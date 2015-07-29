gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_returns_offset
    key_generator = KeyGenerator.new('12345', '072715')
    assert_equal '1225', key_generator.offset
  end

  def test_returns_random_offset
    key_generator = KeyGenerator.new('12345')
    date = Time.new.strftime("%m%d%y")
    date_squared = date.to_i ** 2
    last_four = date_squared.to_s[-4..-1]
    assert_equal last_four, key_generator.offset
  end

  def test_returns_random_key
    key_generator = KeyGenerator.new
    assert_equal Time.now.strftime("%H%M%S")[0..4], key_generator.key
  end

  def test_returns_key
    key_generator = KeyGenerator.new('12345')
    assert_equal '12345', key_generator.key
  end

    ####

  # def test_that_rot_a_offset_comes_from_cipher_class
  #   key_generator = KeyGenerator.new('12345', '072815')#last 4 digits are 4225
  #   assert_equal 4, key_generator.offset(0)
  # end
  #
  # def test_that_rot_d_offset_comes_from_cipher_class
  #   key_generator = KeyGenerator.new('12345', '072815')#last 4 digits are 4225
  #   assert_equal 5, key_generator.offset(3)
  # end
  #
  #
  # def test_encrypts_text
  #   skip
  #   key_generator = KeyGenerator.new('12345', '072815')
  #   assert_equal '<something>', encryptor.rotate('poptarts')
  # end
end
# class KeyGeneratorTest < Minitest::Test
#
#   def test_time_is_created
#     kg = KeyGenerator.new
#     t = Time.new
#     assert_equal kg.input_time, t.strftime("%H%M%S")
#   end
#
#   def test_that_last_five_digits_of_time_are_output
#     kg = KeyGenerator.new
#     time_key = kg.input_time
#     assert_equal kg.generate_key, time_key[0..4]
#   end
#
#   def test_that_date_is_created
#     kg = KeyGenerator.new
#     t = Time.new
#     assert_equal kg.input_date, t.strftime("%m%d%y")
#   end
#
# end
