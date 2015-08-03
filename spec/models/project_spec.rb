require 'spec_helper'

describe Project do
  describe "validations" do
  	context "when project is created without a name" do
  		it "should not be valid" do
  			project = FactoryGirl.build(:project, :name => nil)
  			expect(project).to_not be_valid
  			expect(project.errors_on(:name)).to include("can't be blank")
  		end
  	end

  	context "when project is created without a description" do
  		it "should not be valid" do
  			project = FactoryGirl.build(:project, :description => nil)
  			expect(project).to_not be_valid
  			expect(project.errors_on(:description)).to include("can't be blank")
  		end
  	end

  	context "when project is created without a client" do
  		it "should be valid" do
  			project = FactoryGirl.build(:project, :client => nil)
  			expect(project).to be_valid
  		end
  	end

  	context "when project is created with a client" do
  		it "should be valid" do
  			project = FactoryGirl.build(:project)
  			expect(project).to be_valid
  		end
  	end

  	context "when project is created without a start date" do
  		it "should be valid" do
  			project = FactoryGirl.build(:project, :date_started => nil)
  			expect(project).to be_valid
  		end
  	end

  	context "when project is created with a start date" do
  		it "should be valid" do
  			project = FactoryGirl.build(:project)
  			expect(project).to be_valid
  		end
  	end
  end

  describe "association" do
  	it "should habtm skills" do
  		should have_and_belong_to_many(:skills)
  	end

  	it "should habtm users" do
  		should have_and_belong_to_many(:users)
  	end
  end
end
