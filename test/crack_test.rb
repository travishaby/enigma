gem 'simplecov', :require => false, :group => :test
require 'simplecov'
SimpleCov.start

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'
require './test/decrypt_test'
require 'pry'

class CrackerTest < Minitest::Test

  def test_remainder_is_zero
    cracker = Cracker.new("theremainder")
    assert_equal 0, cracker.remainder
  end

  def test_remainder_three
    cracker = Cracker.new("theremainderwillbet")
    assert_equal 3, cracker.remainder
  end

  def test_if_remainder_zero_return_proper_rotation_a
    cracker = Cracker.new("od..")
    cracker.find_rotation
    assert_equal 1, cracker.rot_a
  end

  def test_if_remainder_zero_return_proper_rotation_b
    cracker = Cracker.new("nc..")
    cracker.find_rotation
    assert_equal 38, cracker.rot_b
  end

  def test_if_remainder_zero_return_proper_rotation_c
    cracker = Cracker.new("ndf.")
    cracker.find_rotation
    assert_equal 6, cracker.rot_c
  end

  def test_if_remainder_zero_return_proper_rotation_d
    cracker = Cracker.new("nd.u")
    cracker.find_rotation
    assert_equal 21, cracker.rot_d
  end

  def test_remainder_of_zero
    cracker = Cracker.new("nnaj")
    assert_equal 0, cracker.remainder
  end

  def test_remainder_of_three
    cracker = Cracker.new("nnajrty")
    assert_equal 3, cracker.remainder
  end

  def test_remove_remainder_zero_times
    cracker = Cracker.new("nnaj")
    assert_equal 0, cracker.remove_remainder
  end

  def test_remove_remainder_three_times
    cracker = Cracker.new("nnajtyr")
    assert_equal 3, cracker.remove_remainder
  end

  def test_remove_remainder_three_times
    cracker = Cracker.new("nnajtyr")
    cracker.remove_remainder
    assert_equal "nnaj", cracker.text
  end

  def test_end_string_gets_chopped_three_times
    cracker = Cracker.new("nhdhdhe")
    cracker.remove_remainder
    assert_equal "..en", cracker.end_string
  end

  def test_end_string_gets_chopped_zero_times
    cracker = Cracker.new("nhdhdhet")
    cracker.remove_remainder
    assert_equal "..end..", cracker.end_string
  end

  def test_find_distance_between_known_character_at_start_and_encrypted_character
    cracker = Cracker.new
    assert_equal 21, cracker.find_distance("a", "v")
  end

  def test_find_distance_between_known_character_in_middle_and_encrypted_character
    cracker = Cracker.new
    assert_equal 19, cracker.find_distance("c", "v")
  end

  def test_find_distance_between_known_character_at_beginning_and_encrypted_character
    cracker = Cracker.new
    assert_equal 38, cracker.find_distance("3", "2")
  end

  def test_find_distance_between_same_known_and_encrypted_char
    cracker = Cracker.new
    assert_equal 0, cracker.find_distance("3", "3")
  end

  def test_cracked_key_equals_expected_value
    cracker = Cracker.new("hey.i wpndes if.thit wiml wprk.a.ene..")
    cracker.remove_remainder
    cracker.find_rotation
    assert_equal "hey i wonder if this will work...end", cracker.decrypt
  end



  def test_case_name

  end

end
