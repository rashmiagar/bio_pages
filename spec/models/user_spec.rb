require 'spec_helper'

def make_user_with_skills(attrs = {})
	user = User.create!(attrs)
		
	3.times {
		skill = FactoryGirl.create(:skill)
		user_skill = FactoryGirl.create(:user_skill, :user_id => user.id, :skill_id => skill.id)
		#u.user_skills << user_skill
	}
	return user
end

RSpec.describe User, :type => :model do
	describe "validations" do
		let(:user) {FactoryGirl.build(:user)}
		context 'when a user is created with a valid name and email' do
			it 'should be valid' do
				expect(user).to be_valid	
			end
		end
		
		context 'when a user is created without a name' do
			before do
 				user.name=nil
				user.valid?
			end				
			
			it 'should not be valid' do
 				expect(user).to_not be_valid
 			end

 			it "should show proper error messages on name atrribute" do
 				expect(user.errors.full_messages).to include("Name can't be blank")
			end
		end

		context 'when a user is created with a very long name (> 50 chars)' do
		    before do
		    	user.name = 'a'*51
		    	user.valid?
		    end

		    it 'should not be valid' do
		    	expect(user).to_not be_valid
		    end
		    it "should show proper error messages on name atrribute" do
 				expect(user.errors.full_messages).to include("Name is too long (maximum is 50 characters)")
			end
		    	
		end

		context 'when a user is created without an email' do
			before do
				user.email = nil
				user.valid?
			end

			it 'should not be valid' do
		    	expect(user).to_not be_valid
			end

			it "should have proper error messages on email atrribute" do
				expect(user.errors.full_messages).to include("Email can't be blank")
			end
		end

		context 'when a user is created with an invalid email' do
				
			before do 
				user.email = 'john.example.com'
				user.valid?
			end

			it 'should not be valid' do
		    	expect(user).to_not be_valid
			end
			
			it "should have proper error messages on email atrribute" do	
				expect(user.errors.full_messages).to include("Email not an email")
			end
		end
	end
end
