gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation'
require './test/generator_test'

class RotationTest < Minitest::Test
include TodayValues

  def test_rotation_accepts_nil_values
    nil_rotation = Rotation.new
    default_rotation = Rotation.new(today_key, today_date)
    assert_equal nil_rotation.final_rotation(0), default_rotation.final_rotation(0)
  end

  def test_that_rot_a_offset_comes_from_cipher_class
    rotation = Rotation.new('12345', '072815')#last 4 digits are 4225
    assert_equal 16, rotation.final_rotation(0)
  end

  def test_that_rot_b_offset_comes_from_cipher_class
    rotation = Rotation.new('23454', '072815')#last 4 digits are 4225
    assert_equal 36, rotation.final_rotation(1)
  end

  def test_that_rot_c_offset_comes_from_cipher_class
    rotation = Rotation.new('12345', '070401')#last 4 digits are 4225
    assert_equal 34, rotation.final_rotation(2)
  end

  def test_that_rot_d_offset_comes_from_cipher_class
    rotation = Rotation.new('34341', '070102')#last 4 digits are 4225
    assert_equal 45, rotation.final_rotation(3)
  end

end
