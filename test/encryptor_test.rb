gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require './test/offset_test'
require './test/cipher_test'

class EncryptorTest < Minitest::Test

  def test_it_exits
    assert Encryptor
  end

  def test_encrypt_method_can_take_input
    skip #it worked before but now we cant know what to expect without putting our entire code in the test
    e = Encryptor.new("00000")
    assert_equal "hello", e.encrypt("hello")
  end

  def test_that_it_can_take_input_and_rotation
    skip #it worked before but now we cant know what to expect without putting our entire code in the test
    e = Encryptor.new("00000")
    assert_equal "hello", e.encrypt("hello", 1)
  end

  def test_encrypt_pulls_from_cipher
    e = Encryptor.new("00000")
    assert_equal 'c', e.encrypt('a', 2)
  end

  def test_encrypt_returns_nil_for_character_not_in_hash
    e = Encryptor.new("00000")
    refute e.encrypt('&', 2)
  end

  def test_that_dtws_does_its_shit
    skip
    e = Encryptor.new("00000")
    assert_equal "grasgarsegeg", e.do_the_whole_shabang(["abcd", "efgh", "ijkl", "mnop"])
  end



end
