gem 'simplecov', :require => false, :group => :test
require 'simplecov'
SimpleCov.start

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './test/cipher_test'
require './test/encrypt_test'
require 'pry'

#test
class DecryptTest < Minitest::Test
  include TodayValues

  def test_decrypt_text
    decryptor = Decrypt.new("abce", '00001', '100000')
    assert_equal "abcd", decryptor.decrypt
  end

  def test_encrypt_text_with_generated_date
    manual_decrypt = Decrypt.new("abcd",
    today_key, today_date).decrypt
    default_decrypt = Decrypt.new("abcd", today_key).decrypt
    assert_equal manual_decrypt, default_decrypt
  end

end
