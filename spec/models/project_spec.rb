require 'spec_helper'

RSpec.describe Project, :type => :model do
  describe "validations" do
  	context "when project is created without a name" do
  		project = FactoryGirl.build(:project, :name => nil)
      before do
        project.valid?
      end

      it "should not be valid" do
  			expect(project).to_not be_valid
      end

      it "should have name as a key in error messages" do
   			expect(project.errors.full_messages).to include("Name can't be blank")
  		end
  	end

  	context "when project is created without a description" do
      project = FactoryGirl.build(:project, :description => nil)
  		
      before do
        project.valid?
      end

      it "should not be valid" do
  			expect(project).to_not be_valid
  		end

      it "should have description as a key in error messages" do
        expect(project.errors.full_messages).to include("Description can't be blank")
  		end
  	end

  	context "when project is created without a client" do
      project = FactoryGirl.build(:project, :client => nil)
      it "should be valid" do
  			expect(project).to be_valid
  		end
  	end

  	context "when project is created with a client" do
      project = FactoryGirl.build(:project)
  		
      it "should be valid" do
  			expect(project).to be_valid
  		end
  	end

  	context "when project is created without a start date" do
      project = FactoryGirl.build(:project, :date_started => nil)
  		
      it "should be valid" do
  			expect(project).to be_valid
  		end
  	end

  	context "when project is created with a start date" do
      project = FactoryGirl.build(:project)
  		
      it "should be valid" do
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
