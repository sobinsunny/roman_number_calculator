require "roman_calculator/version"
require "roman_calculator/roman_calculator"

class String
	  include RomanCalculator::StringExtentions

	  # do arithmetic operations

	  def calculate_in_roman
	  	left_operand, operator, right_operand = _get_operators
	  	left_operand.to_number.public_send(operator, right_operand.to_number).to_roman
	  end

	  private
	  # separate operand and operators
	  def _get_operators
	  	self.split(/(\w+\.?\w*)/).collect(&:strip).reject(&:empty?)
	  end
end
