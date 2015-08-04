require 'spec_helper'

describe SkillsController do
	describe "GET #index" do
		context "with valid attributes" do
			it "populates an array of skills" do
				skill = FactoryGirl.create(:skill)
				get :index
				expect(assigns(:skills)).to match_array [skill]
			end

			it "renders the index view" do
				get :index
				expect(response).to render_template(:index)
			end			
		end
	end

	describe "GET #show" do
		it "assigns the requested skill to @skill" do
			skill = FactoryGirl.create(:skill)
			get :show, id: skill
			expect(assigns(:skill)).to eq(skill)
		end

		it "redirects to show page" do
			skill = FactoryGirl.create(:skill)
			get :show, id: skill
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested skill to @skill" do
			skill = FactoryGirl.create(:skill)
			get :edit, id: skill
			expect(assigns(:skill)).to eq(skill)
		end

		it "redirects to edit page" do
			skill = FactoryGirl.create(:skill)
			get :edit, id: skill
			expect(response).to render_template :edit
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the skill in the database" do
				expect{
					post :create, skill: FactoryGirl.attributes_for(:skill)
				}.to change(Skill, :count).by(1)	
			end

			it "assigns @skill" do
				post :create, skill: FactoryGirl.attributes_for(:skill)
				expect(assigns(:skill)).to_not be_nil
			end

			it "redirects to index page" do
				post :create, skill: FactoryGirl.attributes_for(:skill)
				expect(response).to render_template :index
			end
		end	

		context "with invalid attributes" do
			it "does not save the skill in the database" do
				expect{
					post :create, skill: FactoryGirl.attributes_for(:invalid_skill)
				}.to_not change(Skill, :count)
			end


			# please check this 
			it "assigns @skill to be nil" do
				post :create, skill: FactoryGirl.attributes_for(:invalid_skill)
				expect(assigns(:invalid_skill)).to be_nil
			end

			it "re-renders the new template" do
				post :create, skill: FactoryGirl.attributes_for(:invalid_skill)
				expect(response).to render_template :new
			end
		end
	end

	describe "DELETE #destroy" do
		let!(:skill) { FactoryGirl.create(:skill) }
		it "deletes the skill from the database" do
			expect {
				delete :destroy, id: skill
				}.to change(Skill, :count).by (-1)
		end

		it "redirects to index page" do
			delete :destroy, id: skill
			expect(response).to redirect_to skills_url
		end
	end

	describe "PUT #update" do
		let!(:skill) { FactoryGirl.create(:skill, name: "Rspec", description: "TDD framework") }
		context "with valid attributes" do
			it "locates the requested @skill" do
				put :update, id: skill, skill: FactoryGirl.attributes_for(:skill)
				expect(assigns(:skill)).to eq(skill)
			end

			it "updates the skill in the database" do
				put :update, id: skill, skill: FactoryGirl.attributes_for(:skill, name: "rspec")
				skill.reload
				expect(skill.name).to eq("rspec")
			end

			it "redirects to the updated skill" do
				put :update, id: skill, skill: FactoryGirl.attributes_for(:skill)
				expect(response).to redirect_to skill
			end
		end

		context "with invalid attributes" do
			it "does not update the skill" do
				put :update, id: skill, skill: FactoryGirl.attributes_for(:skill, name: nil)
				skill.reload
				expect(skill.name).to_not be_nil
			end

			it "re-renders the edit page" do
				put :update, id: skill, skill: FactoryGirl.attributes_for(:skill, name: nil)
				expect(response).to render_template("edit")
			end
		end
	end

end
