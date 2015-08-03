require 'spec_helper'

describe Category do
  describe "validations" do
  	let(:category) { FactoryGirl.build(:category) }
  	context "when category is created without a name" do
  		it "should not be valid" do
  			category.name = nil
  			expect(category).to have(1).errors_on(:name)
  			expect(category.errors_on(:name)).to include("can't be blank")
  		end
  	end

  	context "when category is created without a description" do
  		it "should be valid" do
  			category.description = nil
  			expect(category).to be_valid
  		end
  	end

  	context "when category is created without a code" do
  		it "should not be valid" do
  			category = FactoryGirl.create(:category)
  			expect(category.code).to_not be_nil
  		end
  	end

  	context "when category is created with a code of wrong format" do
  		it "should not be valid" do
  			category = FactoryGirl.create(:category)
  			expect(category.code).to eq("PROGRAMMING_LANGUAGES")
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
