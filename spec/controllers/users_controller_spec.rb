require 'spec_helper'

RSpec.describe UsersController, :type => :controller do
	before :each do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
	end

	describe "GET #index" do
		context "with valid attributes" do
			it "populates an array of users" do
				#user = FactoryGirl.create(:user, :email => Faker::Internet.email)
				get :index
				expect(assigns(:users)).to match_array [@user]
			end

			it "renders the index view" do
				get :index
				expect(response).to render_template(:index)
			end			
		end
	end

	describe "GET #show" do
		it "assigns the requested user to @user" do
			#user = FactoryGirl.create(:user)
			get :show, id: @user
			expect(assigns(:user)).to eq(@user)
		end

		it "redirects to show page" do
			#user = FactoryGirl.create(:user)
			get :show, id: @user
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested user to @user" do
			#email = Faker::Internet.email
			#user = FactoryGirl.create(:user, :email => email)
			get :edit, id: @user
			expect(assigns(:user)).to eq(@user)
		end

		it "redirects to edit page" do
			#user = FactoryGirl.create(:user, :email => Faker::Internet.email)
			get :edit, id: @user
			expect(response).to render_template :edit
		end
	end

	describe "POST #create" do
		before :each do 
			post :create, user: FactoryGirl.attributes_for(:user, :email => Faker::Internet.email)
		end

		context "with valid attributes" do
			it "saves the user in the database" do
				expect{
					post :create, user: FactoryGirl.attributes_for(:user, :email => Faker::Internet.email)
				}.to change(User, :count).by(1)	
			end

			it "assigns @user" do
				# post :create, user: FactoryGirl.attributes_for(:user, :email => Faker::Internet.email)
				expect(assigns(:user)).to_not be_nil
			end

			it "redirects to index page" do
				# post :create, user: FactoryGirl.attributes_for(:user, :email => Faker::Internet.email)
				expect(response).to render_template :index
			end
		end	

		context "with invalid attributes" do
			before :each do
				post :create, user: FactoryGirl.attributes_for(:invalid_user)
			end
			
			it "does not save the user in the database" do
				expect{
					post :create, user: FactoryGirl.attributes_for(:invalid_user)
				}.to_not change(User, :count)
			end


			# please check this 
			it "assigns @user to be nil" do
				# post :create, user: FactoryGirl.attributes_for(:invalid_user)
				expect(assigns(:invalid_user)).to be_nil
			end

			it "re-renders the new template" do
				# post :create, user: FactoryGirl.attributes_for(:invalid_user)
				expect(response).to render_template :new
			end
		end
	end

	describe "DELETE #destroy" do
		let!(:user) { FactoryGirl.create(:user, :email => Faker::Internet.email) }
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
		let!(:user1) { FactoryGirl.create(:user, name: "Rashmi Agarwal", email: "rashmi@cybrilla.com") }

		before :each do 
			# put :update, id: user1, user: FactoryGirl.attributes_for(:user, name: "R A")
			put :update, id: user1, user: {name: "R A"}
			user1.reload
		end

		context "with valid attributes" do
			it "locates the requested @user" do
				expect(assigns(:user)).to eq(user1)
			end

			it "updates the user in the database" do
			
				expect(user1.name).to eq("r a")
			end

			it "redirects to the updated user" do
				# put :update, id: user1, user: FactoryGirl.attributes_for(:user)
				expect(response).to redirect_to user1
			end
		end

		context "with invalid attributes" do
			it "does not update the user" do
				put :update, id: user1, user: FactoryGirl.attributes_for(:user, name: nil)
				user1.reload
				expect(user1.name).to_not be_nil
			end

			it "re-renders the edit page" do
				put :update, id: user1, user: FactoryGirl.attributes_for(:user, name: nil)
				expect(response).to render_template("edit")
			end
		end
	end
end
