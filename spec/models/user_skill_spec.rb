describe UserSkill do
	describe "associations" do
		#user = FactoryGirl.build(:user)
		let(:user_skill) {FactoryGirl.build(:invalid_user_skill)} 
		it "should belong to user" do
			#user_skill.user = nil
			user_skill.should_not be_valid
			expect(user_skill).to have(1).errors_on(:user_id)
			expect(user_skill.errors_on(:user_id)).to include("can't be blank")
		end
		it "should belong to skill" do
			#user_skill = UserSkill.new(:skill => nil)
			user_skill.should_not be_valid
			expect(user_skill.errors_on(:skill_id)).to include("can't be blank")
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
		context "when a user_skill is created without a mastered attribute" do
			it "should not be valid" do
				user_skill = FactoryGirl.build(:user_skill, :mastered => nil)
				expect(user_skill).to_not be_valid
				expect(user_skill).to have(1).errors_on(:mastered) 
				expect(user_skill.errors_on(:mastered)).to include("can't be blank")
			end
		end

		context "when a user_skill is created without a description" do
			it "should not be valid" do
				user_skill = UserSkill.new(:description => nil)
				expect(user_skill).to have(1).errors_on(:description)
				expect(user_skill.errors_on(:description)).to include("can't be blank")
			end
		end
	end
end