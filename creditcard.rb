class CreditNumber

	def initialize(string)
		@string = string
	end


	def is_valid?
		#Convert string to an inverted array
		array = @string.gsub(" ","").reverse.split('').map {|b| b.to_i }

		#Double the odd elements and  if the result is >9 then add their single digtis
		index = 1
		new_array = array.map do |b| 
			b = b * 2 if index.even?
			b = (b % 10) + 1 if b > 9
			index += 1
			b
		end

		#Sum up all the elements 
		sum = new_array.inject{|sum,x| sum + x }

		#Return true if divisible by 10	
		(sum % 10) == 0
	end


	def card_type
	  string = @string.gsub("/D/", "")
	  case string
	    when /^3[47][0-9]{13}$/ then "AMEX"
		when /^6(?:011)[0-9]{12}$/ then "Discover"
		when /^5[1-5][0-9]{14}$/ then "MasterCard"
	    when /^4[0-9]{12}(?:[0-9]{3})?$/ then "VISA"
	    else "Unknown"
	  end
	end

	 def test_number
	   if is_valid? and card_type
		   	" #{card_type}: #{@string}    (Valid)" 
		else
	   		" #{card_type}: #{@string}      (Invalid) "   
	    end  
	end

end


if __FILE__==$0
	card = CreditNumber.new '4111111111111111' # Visa valid
	puts card.test_number

	card = CreditNumber.new '4111111111111' # Visa invalid
	puts card.test_number

	card = CreditNumber.new '4012888888881881' # Visa valid
	puts card.test_number

	card = CreditNumber.new '378282246310005' # AmEx valid
	puts card.test_number

	card = CreditNumber.new '6011111111111117' # Discover valid
	puts card.test_number

	card = CreditNumber.new '5105105105105100' # Mastercard valid
	puts card.test_number

	card = CreditNumber.new '5105105105105106' # Mastercard invalid
	puts card.test_number

	card = CreditNumber.new '9111111111111111' # unknown
	puts card.test_number
end
	

