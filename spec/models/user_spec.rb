require 'spec_helper'

def make_user_with_skills(attrs = {})
	User.create!(attrs) do |u|
		skill = FactoryGirl.build(:skill)
		3.times {u.skills << skill}
	end
end

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

		context 'when a user is created with a very long name (> 50 chars)' do
		    it 'should not be valid' do
		    	#str  = ""
		    	#51.times{str = str+'a'}
		    	user.name = 'a'*51
		    	expect(user).to have(1).errors_on(:name)
		    end
		end

		context 'when a duplicate email address is given' do
			it 'should not be valid' do
				joe = FactoryGirl.create(:user, name: "joe", email: "john@example.com")
				john = FactoryGirl.build(:user)
				expect(john).to have(1).errors_on(:email)
				expect(john.errors_on(:email)).to include("has already been taken")
			end
		end

		context 'when a user is created with a not unique email (case insensitive)' do
			it 'should not be valid' do
				joe = FactoryGirl.create(:user, email: "John@example.com")
				john = FactoryGirl.build(:user)
				#expect(@john).to raise_error(ActiveRecord::RecordInvalid)
				
				expect(john).to have(1).errors_on(:email)
				expect(john.errors_on(:email)).to include("has already been taken")
			end
		end

		context 'when a user is created without an email' do
			it 'should not be valid' do
				user.email = nil
				#expect(user).to have(1).errors_on(:email)
				expect(user.errors_on(:email)).to include("can't be blank")
			end
		end

		context 'when a user is created with an invalid email' do
			it 'should not be valid' do
				user.email = 'john.example.com'
				expect(user).to have(1).errors_on(:email)
			end
		end
	end

	describe "relations" do
		it "should have many relations with skills" do
			make_user_with_skills(:name => "John", :email => "john@example.com").skills.size.should == 3
		end
	end
end
