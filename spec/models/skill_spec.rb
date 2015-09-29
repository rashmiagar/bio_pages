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




RSpec.describe Skill, :type => :model do
  describe "validations" do
  	let(:skill) { FactoryGirl.build(:skill) }
  	context "when skill is created without a name" do
        		
      before do
        skill.name = nil
        skill.valid?
      end

      it "should not be valid" do
  			expect(skill).not_to be_valid
  		end

      it "should have proper error messages on name attribute" do
        expect(skill.errors.full_messages).to include("Name can't be blank")
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
  		before do
        skill.category = nil
        skill.valid?
      end

      it "should not be valid" do
  			expect(skill.errors.full_messages).to include("Category can't be blank")
  		end
  	end

  	context "when skill is created without a code" do
      skill = FactoryGirl.create(:skill)
  		
      it "should be valid" do
  			expect(skill).to be_valid
  		end
  	end

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