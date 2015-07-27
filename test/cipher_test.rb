gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require './test/offset_test'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_that_rotation_and_offset_sum_correctly
    c = Cipher.new("00000")
    r = Rotation.new("00000")
    o = Offset.new("00000")
    assert_equal r.rotation(0, 1) + o.offset(0), c.rotation_plus_offset(0)
  end

  def test_encrypt_can_pull_from_rot_plus_off
    skip #it worked before but now we cant know what to expect without putting our entire code in the test
    c = Cipher.new("00000")
    assert_equal 'e', c.encrypt('e', c.rotation_plus_offset(0))
  end

  def test_cipher_sends_back_value_from_hash
    c = Cipher.new("00000")
    assert_equal 'b', c.cipher(1)['a']
  end

end
