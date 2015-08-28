require 'spec_helper'
require 'pry'

# def make_skills_with_category(attrs = {})
# 	Skill.build(attrs) do |skill|
#     category = FactoryGirl.build(:category)
#     skill.category = category
#   end
# end

def make_skills_with_users(attrs = {})
  s = Skill.create!(attrs)
    #user = FactoryGirl.build(:user)
   
    3.times { 
      email_id = Faker::Internet.email
      user = FactoryGirl.create(:user, :email => email_id )
      #user_skill = UserSkill.create(:user_id => user.id, :skill_id => s.id, :mastered => true, :description => "description")
      user_skill = FactoryGirl.create(:user_skill, :user_id => user.id, :skill_id => s.id)
     # s.users << user_skill.user 
    }
  return s
end




describe Skill do
  describe "validations" do
  	let(:skill) { FactoryGirl.build(:skill) }
  	context "when skill is created without a name" do
  		it "should not be valid" do
  			skill.name = nil
  			expect(skill).to have(1).errors_on(:name)
  			expect(skill.errors_on(:name)).to include("can't be blank")
  		end
  	end

  	context "when skill is created without a description" do
  		it "should be valid" do
  			skill.description = nil
  			expect(skill).to be_valid
  		end
  	end

  	context "when skill is created with a description" do
  		it "should be valid" do
  			expect(skill).to be_valid
  		end
  	end

  	context "when skill is created without a category_id" do
  		it "should not be valid" do
  			skill.category = nil
  			expect(skill.errors_on(:category_id)).to include("can't be blank")
  		end
  	end

  	context "when skill is created without a code" do
  		it "should not be valid" do
  			skill = FactoryGirl.create(:skill)
  			expect(skill.code).to_not be_nil
  		end
  	end

  	context "when skill is created with a code of correct format" do
  		it "should be valid" do
        skill = FactoryGirl.create(:skill)
  			#skill.code = "RUBY_ON_RAILS"

  			expect(skill.code).to eq("RUBY_ON_RAILS")
  		end
  	end

  	# context "when skill is created with a code of wrong format" do
  	# 	it "should not be valid" do
   #      Skill.stub(:generate_code).and_return("RUBY ON RAILS")
   #      skill = FactoryGirl.create(:skill, :code => "rubyonrails")
    
  	# 		expect(skill).to have(1).errors_on(:code)
  	# 		#check error message
  	# 	end
  	# end

  	context "when skill is created without an abbreviation" do
  		it "should be valid" do
  			skill.abbreviation = nil
  			expect(skill).to be_valid
  		end
  	end

  	context "when skill is created with an abbreviation" do
  		it "should be valid" do
  			expect(skill).to be_valid
  		end
  	end
  end

  describe "associations" do
    let(:skill) { FactoryGirl.build(:skill) }
    it "should have many relations with users" do
      make_skills_with_users(:name => "Ruby on rails", :category_id => 1).users.size.should == 3
    end

    it "should belong to one category" do
      expect(skill).to respond_to :category
      #make_skills_with_category(:name => "Ruby on rails").category.size.should == 1
    end

    it "should habtm projects" do
      should have_and_belong_to_many(:projects)
    end
  end
end