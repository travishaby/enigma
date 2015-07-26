gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'
require './test/encryptor_test'
require './lib/cracker'
require 'pry'

class CrackerTest < Minitest::Test

  def test_it_exits
    assert Cracker
  end

  def test_find_distance_between_known_character_at_start_and_encrypted_character
    c = Cracker.new
    assert_equal 21, c.find_distance("a", "v")
  end

  def test_find_distance_between_known_character_in_middle_and_encrypted_character
    c = Cracker.new
    assert_equal 19, c.find_distance("c", "v")
  end

  def test_find_distance_between_known_character_at_beginning_and_encrypted_character
    c = Cracker.new
    assert_equal 38, c.find_distance("3", "2")
  end

  def test_find_distance_between_same_known_and_encrypted_char
    c = Cracker.new
    assert_equal 0, c.find_distance("3", "3")
  end

  def method_name

  end

end
