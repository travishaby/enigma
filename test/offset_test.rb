gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'


class OffsetTest < Minitest::Test

  def test_it_exists
    assert Offset
  end

  def test_offset_comes_from_key_generator
    o = Offset.new
    kg = KeyGenerator.new
    assert_equal kg.generate_offset[1].to_i, o.offset_parser(1)
  end

  def test_offset_a
      o = Offset.new
      assert_equal o.offset_parser(0), o.offset(0)
  end

  def test_offset_b
      o = Offset.new
      assert_equal o.offset_parser(1), o.offset(1)
  end

  def test_offset_c
      o = Offset.new
      assert_equal o.offset_parser(2), o.offset(2)
  end

  def test_offset_d
      o = Offset.new
      assert_equal o.offset_parser(3), o.offset(3)
  end

end
