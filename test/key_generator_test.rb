gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists
    assert KeyGenerator
  end

  def test_time_is_created
    kg = KeyGenerator.new
    t = Time.new
    assert_equal kg.input_time, t.strftime("%H%M%S")
  end

  def test_that_last_five_digits_of_time_are_output
    kg = KeyGenerator.new
    time_key = kg.input_time
    assert_equal kg.generate_key, time_key[1..5]
  end

  def test_that_date_is_created
    kg = KeyGenerator.new
    t = Time.new
    assert_equal kg.input_date, t.strftime("%m%d%y")
  end

  def test_that_input_date_is_squared
    kg = KeyGenerator.new
    t = Time.new
    t = t.strftime("%m%d%y")
    assert_equal (kg.input_date).to_i**2, kg.generate_date_squared
  end

  def test_generate_offset_give_last_four_numbers_of_squared
    kg = KeyGenerator.new
    assert_equal kg.generate_date_squared.to_s[-4..-1], kg.generate_offset
  end

end