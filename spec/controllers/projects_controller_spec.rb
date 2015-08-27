require 'spec_helper'

describe ProjectsController do
	before :each do
		@user = FactoryGirl.create(:user)
		set_user_session @user
	end

	describe "GET #index" do
		context "with valid attributes" do
			it "populates an array of projects" do
				project = FactoryGirl.create(:project)
				get :index
				expect(assigns(:projects)).to match_array [project]
			end

			it "renders the index view" do
				get :index
				expect(response).to render_template(:index)
			end			
		end
	end

	describe "GET #show" do
		it "assigns the requested project to @project" do
			project = FactoryGirl.create(:project)
			get :show, id: project
			expect(assigns(:project)).to eq(project)
		end

		it "redirects to show page" do
			project = FactoryGirl.create(:project)
			get :show, id: project
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested project to @project" do
			project = FactoryGirl.create(:project)
			get :edit, id: project
			expect(assigns(:project)).to eq(project)
		end

		it "redirects to edit page" do
			project = FactoryGirl.create(:project)
			get :edit, id: project
			expect(response).to render_template :edit
		end
	end

	describe "POST #create" do
		before :each do
			post :create, project: FactoryGirl.attributes_for(:project), :format => :js
		end

		context "with valid attributes" do
			it "saves the project in the database" do
				expect{
					post :create, project: FactoryGirl.attributes_for(:project), :format => :js
				}.to change(Project, :count).by(1)	
			end

			it "assigns @project" do
				# post :create, project: FactoryGirl.attributes_for(:project)
				expect(assigns(:project)).to_not be_nil
			end

			it "redirects to index page" do
				# post :create, project: FactoryGirl.attributes_for(:project)
				expect(response).to render_template :create
			end
		end	

		context "with invalid attributes" do
			before :each do
				post :create, project: FactoryGirl.attributes_for(:invalid_project)
			end

			it "does not save the project in the database" do
				expect{
					post :create, project: FactoryGirl.attributes_for(:invalid_project)
				}.to_not change(Project, :count)
			end


			# please check this 
			it "assigns @project to be nil" do
				# post :create, project: FactoryGirl.attributes_for(:invalid_project)
				expect(assigns(:invalid_project)).to be_nil
			end

			it "re-renders the new template" do
				# post :create, project: FactoryGirl.attributes_for(:invalid_project)
				expect(response).to render_template :new
			end
		end
	end

	describe "DELETE #destroy" do
		let!(:project) { FactoryGirl.create(:project) }
		it "deletes the project from the database" do
			expect {
				delete :destroy, id: project
				}.to change(Project, :count).by (-1)
		end

		it "redirects to index page" do
			delete :destroy, id: project
			expect(response).to redirect_to projects_url
		end
	end

	describe "PUT #update" do
		let!(:project) { FactoryGirl.create(:project, name: "Omveria", description: "Create dynamic mobile apps") }
		context "with valid attributes" do
			it "locates the requested @project" do
				put :update, id: project, project: FactoryGirl.attributes_for(:project)
				expect(assigns(:project)).to eq(project)
			end

			it "updates the project in the database" do
				put :update, id: project, project: FactoryGirl.attributes_for(:project, name: "Earningscast")
				project.reload
				expect(project.name).to eq("Earningscast")
			end

			it "redirects to the updated project" do
				put :update, id: project, project: FactoryGirl.attributes_for(:project)
				expect(response).to redirect_to project
			end
		end

		context "with invalid attributes" do
			it "does not update the project" do
				put :update, id: project, project: FactoryGirl.attributes_for(:project, name: nil)
				project.reload
				expect(project.name).to_not be_nil
			end

			it "re-renders the edit page" do
				put :update, id: project, project: FactoryGirl.attributes_for(:project, name: nil)
				expect(response).to render_template("edit")
			end
		end
	end
end
