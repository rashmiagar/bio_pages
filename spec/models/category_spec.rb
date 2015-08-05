require 'spec_helper'

describe Category do
  describe "associations" do
  	it "should have many relations with skills" do
  		category = FactoryGirl.build(:category)
  		skill = FactoryGirl.build(:skill)
  		3.times {category.skills << skill}
  		expect(category.skills.size).to eq(3)
  	end
  end
end
