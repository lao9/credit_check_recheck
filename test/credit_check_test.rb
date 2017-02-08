require "minitest/autorun"
require "minitest/pride"
require "./lib/credit_check"
require "pry"

class CreditCheckTest < Minitest::Test

  def setup
    @tester = CreditCheck.new("4929735477250543")
  end

  def test_intialized_values
    assert_equal 0, @tester.total
  end

  def test_it_saves_card_num_in_reverse
    assert_equal "3450527745379294", @tester.card_number
    assert_equal String, @tester.card_number.class
    refute @tester.card_number.empty?
  end

  def test_sum_values_greater_than_nine
    assert_equal 9, @tester.sum_value_greater_nine(9)
    assert_equal 1, @tester.sum_value_greater_nine(10)
    assert_equal 6, @tester.sum_value_greater_nine(15)
    assert_equal 3, @tester.sum_value_greater_nine(3)
  end

  def test_even_odd_checker
    assert_equal 3, @tester.even_odd_checker(0)
    assert_equal 8, @tester.even_odd_checker(1)
    assert_equal 5, @tester.even_odd_checker(2)
    assert_equal 0, @tester.even_odd_checker(3)
    assert_equal 5, @tester.even_odd_checker(4)
    assert_equal 4, @tester.even_odd_checker(5)
  end

  def test_number_iterator
    assert_equal 80, @tester.number_iterator
  end

  def test_modulo_checker
    assert_equal "The number is valid!", @tester.modulo_validator(10)
    assert_equal "The number is invalid!", @tester.modulo_validator(82)
    assert_equal "The number is valid!", @tester.modulo_validator(70)
    assert_equal "The number is invalid!", @tester.modulo_validator(68)
  end

  def test_checker_valid_numbers
    assert_equal "The number is valid!", @tester.checker
    test1 = CreditCheck.new("5541808923795240")
    test2 = CreditCheck.new("4024007136512380")
    test3 = CreditCheck.new("6011797668867828")
    test4 = CreditCheck.new("342804633855673")
    assert_equal "The number is valid!", test1.checker
    assert_equal "The number is valid!", test2.checker
    assert_equal "The number is valid!", test3.checker
    assert_equal "The number is valid!", test4.checker
  end

  def test_checker_invalid_numbers
    test1 = CreditCheck.new("5541801923795240")
    test2 = CreditCheck.new("4024007106512380")
    test3 = CreditCheck.new("6011797668868728")
    test4 = CreditCheck.new("342801633855673")
    assert_equal "The number is invalid!", test1.checker
    assert_equal "The number is invalid!", test2.checker
    assert_equal "The number is invalid!", test3.checker
    assert_equal "The number is invalid!", test4.checker
  end

end
