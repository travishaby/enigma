gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/generator'
require './test/today_values_module'

class GeneratorTest < Minitest::Test
  include TodayValues

  def test_nil_date_is_acceptable
    generator = Generator.new('12345', today_date)
    generator2 = Generator.new('12345')
    assert_equal generator.date, generator2.date
  end

  def test_nil_date_is_acceptable
    generator = Generator.new
    generator2 = Generator.new(today_key)
    assert_equal generator.key, generator2.key
  end

  def test_accepts_nil_values_for_key_and_date
    generator = Generator.new
    generator2 = Generator.new
    assert_equal generator.key, generator2.key
    assert_equal generator.date, generator2.date
  end

  def test_returns_offset
    generator = Generator.new('12345', '072715')
    assert_equal '1225', generator.offset
  end

  def test_returns_random_offset
    generator = Generator.new('12345')
    date_squared = today_date.to_i ** 2
    last_four = date_squared.to_s[-4..-1]
    assert_equal last_four, generator.offset
  end

  def test_returns_random_key
    generator = Generator.new
    assert_equal today_key, generator.key
  end

end
