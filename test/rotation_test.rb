gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation'
require './lib/key_generator'

class RotationTest < Minitest::Test

  def test_it_exists
    assert Rotation
  end

  def test_rotation_parser_takes_from_key_generator
    r = Rotation.new
    kg = KeyGenerator.new
    assert_equal kg.generate_key, r.rotation_parser(0, 4)
  end

  def test_rotation_A
    r = Rotation.new
    assert_equal r.rotation(0, 1), r.rotation_parser(0, 1).to_i
  end

  def test_rotation_B
    r = Rotation.new
    assert_equal r.rotation(1, 2), r.rotation_parser(1, 2).to_i
  end

  def test_rotation_C
    r = Rotation.new
    assert_equal r.rotation(2, 3), r.rotation_parser(2, 3).to_i
  end

  def test_rotation_D
    r = Rotation.new
    assert_equal r.rotation(3, 4), r.rotation_parser(3, 4).to_i
  end

end
