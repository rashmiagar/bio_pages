require 'spec_helper'

describe Category do
  describe "validations" do
  	let(:category) { FactoryGirl.build(:category) }
  	context "when category is created without a name" do
      before do
        category.name = nil
  		  category.valid?
      end

      it "should not be valid" do
        expect(category).to_not be_valid
      end
      it "should have proper error messages on name attribute" do
  			expect(category.errors.full_messages).to include("Name can't be blank")
  		end
  	end

  	context "when category is created without a description" do
      before do
        category.description = nil
        category.valid?
      end

      it "should be valid" do
  			expect(category).to be_valid
  		end
  	end

  	context "when category is created without a code" do
      category = FactoryGirl.create(:category)
      before do
        category.code = nil
        category.valid?
      end  		
      it "should be valid" do
  			expect(category).to be_valid
  		end
  	end
  end
  
  describe "associations" do
  	it "should have many relations with skills" do
  		category = FactoryGirl.build(:category)
  		skill = FactoryGirl.build(:skill)
  		3.times {category.skills << skill}
  		expect(category.skills.size).to eq(3)
  	end
  end
end
