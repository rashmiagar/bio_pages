require 'spec_helper'

describe UsersController do
	describe "GET #index" do
		context "with valid attributes" do
			it "populates an array of users" do
				user = FactoryGirl.create(:user)
				get :index
				expect(assigns(:users)).to match_array [user]
			end

			it "renders the index view" do
				get :index
				expect(response).to render_template(:index)
			end			
		end
	end

	describe "GET #show" do
		it "assigns the requested user to @user" do
			user = FactoryGirl.create(:user)
			get :show, id: user
			expect(assigns(:user)).to eq(user)
		end

		it "redirects to show page" do
			user = FactoryGirl.create(:user)
			get :show, id: user
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested user to @user" do
			user = FactoryGirl.create(:user)
			get :edit, id: user
			expect(assigns(:user)).to eq(user)
		end

		it "redirects to edit page" do
			user = FactoryGirl.create(:user)
			get :edit, id: user
			expect(response).to render_template :edit
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the user in the database" do
				expect{
					post :create, user: FactoryGirl.attributes_for(:user)
				}.to change(User, :count).by(1)	
			end

			it "assigns @user" do
				post :create, user: FactoryGirl.attributes_for(:user)
				expect(assigns(:user)).to_not be_nil
			end

			it "redirects to index page" do
				post :create, user: FactoryGirl.attributes_for(:user)
				expect(response).to render_template :index
			end
		end	

		context "with invalid attributes" do
			it "does not save the user in the database" do
				expect{
					post :create, user: FactoryGirl.attributes_for(:invalid_user)
				}.to_not change(User, :count)
			end


			# please check this 
			it "assigns @user to be nil" do
				post :create, user: FactoryGirl.attributes_for(:invalid_user)
				expect(assigns(:invalid_user)).to be_nil
			end

			it "re-renders the new template" do
				post :create, user: FactoryGirl.attributes_for(:invalid_user)
				expect(response).to render_template :new
			end
		end
	end

	describe "DELETE #destroy" do
		let!(:user) { FactoryGirl.create(:user) }
		it "deletes the user from the database" do
			expect {
				delete :destroy, id: user
				}.to change(User, :count).by (-1)
		end

		it "redirects to index page" do
			delete :destroy, id: user
			expect(response).to redirect_to users_url
		end
	end

	describe "PUT #update" do
		let!(:user) { FactoryGirl.create(:user, name: "Rashmi Agarwal", email: "rashmi@cybrilla.com") }
		context "with valid attributes" do
			it "locates the requested @user" do
				put :update, id: user, user: FactoryGirl.attributes_for(:user)
				expect(assigns(:user)).to eq(user)
			end

			it "updates the user in the database" do
				put :update, id: user, user: FactoryGirl.attributes_for(:user, name: "R A")
				user.reload
				expect(user.name).to eq("R A")
			end

			it "redirects to the updated user" do
				put :update, id: user, user: FactoryGirl.attributes_for(:user)
				expect(response).to redirect_to user
			end
		end

		context "with invalid attributes" do
			it "does not update the user" do
				put :update, id: user, user: FactoryGirl.attributes_for(:user, name: nil)
				user.reload
				expect(user.name).to_not be_nil
			end

			it "re-renders the edit page" do
				put :update, id: user, user: FactoryGirl.attributes_for(:user, name: nil)
				expect(response).to render_template("edit")
			end
		end
	end
end
