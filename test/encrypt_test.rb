gem 'simplecov', :require => false, :group => :test
require 'simplecov'
SimpleCov.start

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require './test/cipher_test'

class EncryptTest < Minitest::Test
  include TodayValues

  def test_encrypt_text
    encryptor = Encrypt.new("abcd", '00001', '100000')
    assert_equal "abce", encryptor.encrypt
  end

  def test_encrypt_text_with_generated_arguments
    manual_encrypt = Encrypt.new("abcd",
    today_key, today_date).encrypt
    default_encrypt = Encrypt.new("abcd").encrypt
    assert_equal manual_encrypt, default_encrypt
  end

end
