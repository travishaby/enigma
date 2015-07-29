gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_encrypt_pulls_from_cipher
    e = Encryptor.new
    assert_equal 'c', e.encrypt('a', 2)
  end

  def test_encrypt_returns_nil_for_character_not_in_hash
    e = Encryptor.new
    refute e.encrypt('&', 2)
  end

  def test_that_dtws_does_its_shit
    skip
    e = Encryptor.new
    assert_equal "grasgarsegeg", e.do_the_whole_shabang(["abcd", "efgh", "ijkl", "mnop"])
  end
  
end
