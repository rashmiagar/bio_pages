describe UserSkill do
	describe "associations" do
		context "When created without user id" do
			let(:user_skill) {FactoryGirl.build(:user_skill, :user_id => nil)} 
			
			before do
				user_skill.valid?
			end

			it "shouldn't be valid" do
				expect(user_skill).to_not be_valid
			end

			it "should have proper error messages" do
				expect(user_skill.errors.full_messages).to include("User can't be blank")
			end
		end

		context "When created without skill id" do
			let(:user_skill) {FactoryGirl.build(:user_skill, :skill_id => nil)} 
			
			before do
				user_skill.valid?
			end

			it "shouldn't be valid" do
				expect(user_skill).to_not be_valid
			end

			it "should have proper error messages" do
				expect(user_skill.errors.full_messages).to include("Skill can't be blank")
			end
		end
		
		context "should belong to one user and one skill" do
			before(:each) do
				@user = FactoryGirl.create(:user)
				@skill = FactoryGirl.create(:skill)
				@user.user_skills << FactoryGirl.create(:user_skill, :user_id => @user.id, :skill_id => @skill.id)
			end

			it "should have created a relationship" do
				UserSkill.first.user.should == @user
				UserSkill.first.skill.should == @skill
			end

			it "should have users" do
				@skill.users.should == [@user]
			end

			it "should have skills" do
				@user.skills.should == [@skill]
			end
		end
	end

	describe "validations" do 
		
		context "When created without mastered" do
			let(:user_skill) {FactoryGirl.build(:user_skill, :mastered => nil)} 
			
			before do
				user_skill.valid?
			end

			it "shouldn't be valid" do
				expect(user_skill).to_not be_valid
			end

			it "should have proper error messages" do
				expect(user_skill.errors.full_messages).to include("Mastered is not included in the list")
			end
		end
	end
end