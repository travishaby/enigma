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
  # def test_that_cipher_recieves_date_from_key_generator
  #   cipher = Cipher.new('12345')
  #   assert_equal Time.new.strftime("%m%d%y"), cipher.generated_date
  # end
  #
  # def test_that_cipher_grabs_last_four_digits_of_generated_date
  #   cipher = Cipher.new('12345')
  #   date = Time.new.strftime("%m%d%y")
  #   date_squared = date.to_i ** 2
  #   last_four = date_squared.to_s[-4..-1]
  #   assert_equal last_four, cipher.generate_offsets
  # end
  #
  # def test_that_cipher_grabs_last_four_digits_of_manual_date
  #   cipher = Cipher.new('12345', '072715')
  #   assert_equal "1225", cipher.generate_offsets
  # end
  #
  # def test_that_rot_a_offset_comes_from_cipher_class
  #   cipher = Cipher.new('12345', '072815')#last 4 digits are 4225
  #   assert_equal 4, cipher.offset(0)
  # end
  #
  # def test_that_rot_d_offset_comes_from_cipher_class
  #   cipher = Cipher.new('12345', '072815')#last 4 digits are 4225
  #   assert_equal 5, cipher.offset(3)
  # end
  #
  # def test_generated_key_comes_from_key_generator
  #   cipher = Cipher.new
  #   assert_equal Time.now.strftime("%H%M%S")[0..4], cipher.generated_key
  # end




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
