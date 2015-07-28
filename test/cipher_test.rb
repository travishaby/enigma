gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require './test/offset_test'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_that_cipher_recieves_date_from_key_generator
    cipher = Cipher.new('12345')
    assert_equal Time.new.strftime("%m%d%y"), cipher.date
  end

  def test_that_cipher_grabs_last_four_digits_of_date_squared
    cipher = Cipher.new('12345')
    assert_equal "4225", cipher.generate_offsets
  end
  # def test_generate_offset_give_last_four_numbers_of_squared
  #   kg = KeyGenerator.new
  #   assert_equal kg.generate_date_squared.to_s[-4..-1], kg.generate_offset
  # end

  def test_encrypts_text
    skip
    cipher = Cipher.new('12345', '072815')
    assert_equal '<something>', encryptor.rotate('poptarts')
  end


  # def test_that_rotation_and_offset_sum_correctly
  #   c = Cipher.new
  #   r = Rotation.new
  #   o = Offset.new
  #   assert_equal r.rotation(0, 1) + o.offset(0), c.rotation_plus_offset(0)
  # end
  #
  # def test_encrypt_can_pull_from_rot_plus_off
  #   skip #it worked before but now we cant know what to expect without putting our entire code in the test
  #   c = Cipher.new
  #   assert_equal 'e', c.encrypt('e', c.rotation_plus_offset(0))
  # end
  #
  # def test_cipher_sends_back_value_from_hash
  #   c = Cipher.new
  #   assert_equal 'b', c.cipher(1)['a']
  # end

end
