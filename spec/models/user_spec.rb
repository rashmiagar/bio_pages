require 'spec_helper'

describe User do
	describe "validations" do
		let(:user) {FactoryGirl.build(:user)}
		context 'when a user is created with a valid name and email' do
			it 'should be valid' do
				expect(user).to be_valid	
			end
		end
		
		context 'when a user is created without a name' do
			it 'should not be valid' do
 				user.name=nil
 				expect(user).to have(1).errors_on(:name)
			end
		end

		context 'when a user is created without a valid name(> 50 chars)' do
		    it 'should not be valid' do
		    	str  = ""
		    	51.times{str = str+'a'}
		    	user.name = str
		    	expect(user).to have(1).errors_on(:name)
		    end
		end

		context 'when a duplicate email address is given' do
			it 'should not be valid' do
				@joe = FactoryGirl.create(:user, name: "joe", email: "john@example.com")
				@john = FactoryGirl.build(:user)
				expect(@john).to have(1).errors_on(:email)
			end
		end

		context 'when a user is created without an email' do
			it 'should not be valid' do
				user.email = nil
				expect(user).to have(1).errors_on(:email)
			end
		end

		context 'when a user is created with an invalid email' do
			it 'should not be valid' do
				user.email = 'john.example.com'
				expect(user).to have(1).errors_on(:email)
			end
		end
	end
end
