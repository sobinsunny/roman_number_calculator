require 'test_helper'

class RomanCalculatorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RomanCalculator::VERSION
  end

  def test_to_roman_test
    assert_equal 'DL', 550.to_roman
  end

  def test_to_number_test
    assert_equal 550, 'DL'.to_number
  end

  def test_addition
    assert_equal 'L', 'XL + X'.calculate_in_roman
  end

  def test_multipilication
    assert_equal 'C', 'X * X'.calculate_in_roman
  end

  def test_substraction
    assert_equal 'XCIX', 'C - I'.calculate_in_roman
  end

  def test_division
    assert_equal 'X', 'C / X'.calculate_in_roman
  end

end
