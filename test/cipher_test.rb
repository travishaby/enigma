gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher'
require './test/rotation_test'
require './test/today_values_module'

class CipherTest < Minitest::Test
include TodayValues

  def test_encrypts_text
    cipher = Cipher.new('00001', '100000')#date offset is 0000
    assert_equal 'abceefgiijkmmnoq', cipher.__crypt("abcdefghijklmnop")
  end

  def test_rotation_of_character_map_give_integer
    cipher = Cipher.new
    assert_equal "d", cipher.rotate_chars(3)["a"]
    assert_equal "a", cipher.rotate_chars(-4)["e"]
  end

  def test_cipher_defaults_to_encrypt
    cipher = Cipher.new('00001', '100000')
    assert_equal 'abce', cipher.__crypt("abcd")
  end

  def test_cipher_can_encrypt_and_decrypt
    pos_cipher = Cipher.new('00001', '100000', "+")
    neg_cipher = Cipher.new('00001', '100000', "-")
    assert_equal 'abcd', pos_cipher.__crypt('abcc')
    assert_equal 'abcd', neg_cipher.__crypt('abce')
  end

end
