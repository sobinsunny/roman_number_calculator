module RomanCalculator
	
	BASIC_ROMAN_LETTER = {
		1000 => 'M',
		900 => 'CM',
		500 => 'D',
		400 => 'CD',
		100 => 'C',
		90 => 'XC',
		50 => 'L',
		40 => 'XL',
		10 => 'X',
		9 => 'IX',
		5 => 'V',
		4 => 'IV',
		1 => 'I'
		}.freeze

		module StringExtentions
			def to_number
				arabic_number = 0
				roman_number = self
				RomanCalculator::BASIC_ROMAN_LETTER.values.each do |roman_letter|
					while roman_number.start_with?(roman_letter)
						arabic_number += BASIC_ROMAN_LETTER.key(roman_letter)
						roman_number = roman_number.slice(roman_letter.length, roman_number.length)
					end
				end
				raise "Can't convert to number" if arabic_number.zero?
				arabic_number
			end
		end

		module FixnumExtention
			def to_roman
				number = self
				roman_letter = ''
				RomanCalculator::BASIC_ROMAN_LETTER.each do |value, letter|
					roman_letter << letter * (number / value)
					number = number % value
				end
				raise "Can't convert to roman number" if roman_letter.empty?
				roman_letter
			end
		end

	end
	Fixnum.send :include, RomanCalculator::FixnumExtention