require 'spec_helper'

describe Skill do
  describe "validations" do
  	context "when skill is created without a present" do
  		it "should not be valid"
  	end

  	context "when skill is created without a description" do
  		it "should be valid"
  	end

  	context "when skill is created with a description" do
  		it "should be valid"
  	end

  	context "when skill is created without a category" do
  		it "should not be valid"
  	end

  	context "when skill is created without an abbreviation" do
  		it "should be valid"
  	end

  	context "when skill is created without a code" do
  		it "should not be valid"
  	end

  	context "when skill is created with a code of correct format" do
  		it "should be valid"
  	end

  	context "when skill is created with a code of wrong format" do
  		it "it should not be valid"
  	end
  end
end