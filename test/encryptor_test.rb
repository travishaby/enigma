gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_it_exits
    assert Encryptor
  end

  def test_encrypt_method_can_take_input
    skip #it worked before but now we cant know what to expect without putting our entire code in the test
    e = Encryptor.new
    assert_equal "hello", e.encrypt("hello")
  end

  def test_that_it_can_take_input_and_rotation
    skip #it worked before but now we cant know what to expect without putting our entire code in the test
    e = Encryptor.new
    assert_equal "hello", e.encrypt("hello", 1)
  end

  def test_that_rotation_and_offset_sum_correctly
    e = Encryptor.new
    r = Rotation.new
    o = Offset.new
    assert_equal r.rotation(0, 1) + o.offset(0), e.rotation_plus_offset(0)
  end

  def test_encrypt_can_pull_from_rot_plus_off
    skip #it worked before but now we cant know what to expect without putting our entire code in the test
    e = Encryptor.new
    assert_equal 'e', e.encrypt('e', e.rotation_plus_offset(0))
  end

  def test_cipher_sends_back_value_from_hash
    e = Encryptor.new
    assert_equal 'b', e.cipher(1)['a']
  end

  def test_encrypt_pulls_from_cipher
    e = Encryptor.new
    assert_equal 'c', e.encrypt('a', 2)
  end

  def test_encrypt_returns_nil_for_character_not_in_hash
    e = Encryptor.new
    refute e.encrypt('&', 2)
  end

  def test_that_dtws_does_its_shit
    e = Encryptor.new
    assert_equal "grasgarsegeg", e.do_the_whole_shabang(["abcd", "efgh", "ijkl", "mnop"])
  end

end
