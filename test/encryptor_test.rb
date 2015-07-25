gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_it_exits
    assert Encryptor
  end

  def test_encrypt_method_can_take_input
    e = Encryptor.new
    assert_equal "hello", e.encrypt("hello")
  end

  def test_that_it_can_take_input_and_rotation
    e = Encryptor.new
    assert_equal 1, e.encrypt("hello", 1)
  end

end
