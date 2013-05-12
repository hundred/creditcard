require File.expand_path("../creditcard", __FILE__)


describe CreditNumber, 'testing validity of credit card numbers' do 
	it 'Number 4111111111111111 should be valid' do
		card = CreditNumber.new "4111111111111111" 
		card.is_valid?.should be_true
	end

	it 'Number 4111111111111 should be invalid' do
		card = CreditNumber.new "4111111111111"
		card.is_valid?.should be_false
	end

	it 'Number 4012888888881881 should be valid' do
		card = CreditNumber.new "4012888888881881" 
		card.is_valid?.should be_true
	end

	it 'Number 378282246310005 should be valid' do
		card = CreditNumber.new "378282246310005" 
		card.is_valid?.should be_true
	end

	it 'Number 6011111111111117 should be valid' do
		card = CreditNumber.new "6011111111111117" 
		card.is_valid?.should be_true
	end

	it 'Number 5105105105105100 should be valid' do
		card = CreditNumber.new "5105105105105100" 
		card.is_valid?.should be_true
	end

	it 'Number 5105105105105106 should be invalid' do
		card = CreditNumber.new "5105105105105106"
		card.is_valid?.should be_false
	end

	it "Number 9111111111111111 should be invalid" do
		card = CreditNumber.new "9111111111111111"
		card.is_valid?.should be_false
	end
 end

describe CreditNumber, "credit card type established" do
	it "Visa 4111111111111111 should be valid" do
		card = CreditNumber.new "4111111111111111"
		card.card_type.should eq 'VISA'
	end


	it "Visa wrong number 4111111111111 should be valid" do
		card = CreditNumber.new "4111111111111"
		card.card_type.should eq 'VISA'
	end


	it "Visa 4012888888881881 should be valid" do
		card = CreditNumber.new "4012888888881881"
		card.card_type.should eq 'VISA'
	end


	it "AMEX 378282246310005 should be valid" do
		card = CreditNumber.new "378282246310005"
		card.card_type.should eq 'AMEX'
	end
	

	it "Discover 6011111111111117 should be valid" do
		card = CreditNumber.new "6011111111111117"
		card.card_type.should eq 'Discover'
	end
	

	it "MasterCard 5105105105105100 should be valid" do
		card = CreditNumber.new "5105105105105100"
		card.card_type.should eq 'MasterCard'
	end
	

	it "MasterCard wrong number 5105105105105106 should be valid" do
		card = CreditNumber.new "5105105105105106"
		card.card_type.should eq 'MasterCard'
	end
	

	it "Unknown wrong number 9111111111111111 should be valid" do
		card = CreditNumber.new "9111111111111111"
		card.card_type.should eq 'Unknown'
	end
	
end
