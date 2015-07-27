gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'
require './test/encryptor_test'
require 'pry'

class DecryptorTest < Minitest::Test

  def test_it_exits
    assert Decryptor
  end

  def test_dtws_negative_does_its_thang
    skip
    d = Decryptor.new("00000")
    assert_equal "notgonnabethesame", d.do_the_whole_shabang_but_negative(["abcd", "efgh"])
  end

  def test_encryption_and_decryption
    d = Decryptor.new("00000")
    e = Encryptor.new("00000")
    encrypted = e.do_the_whole_shabang(["abcd", "efgh"])
    assert_equal "abcdefgh", d.decrypt_everythang(encrypted.scan(/.{1,4}/))
    #sorry im not sorry for using a regex
  end

  def test_decryption_while_passing_specified_key
    skip
    d = Decryptor.new("00000")
    assert_equal "pob7tsf ", d.decrypt_everythang(["abcd", "efgh"])
  end

end
