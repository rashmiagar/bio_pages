require 'spec_helper'

describe CategoriesController do
	describe "GET #index" do
		context "with valid attributes" do
			it "populates an array of categorys" do
				category = FactoryGirl.create(:category)
				get :index
				expect(assigns(:categories)).to match_array [category]
			end

			it "renders the index view" do
				get :index
				expect(response).to render_template(:index)
			end			
		end
	end

	describe "GET #show" do
		it "assigns the requested category to @category" do
			category = FactoryGirl.create(:category)
			get :show, id: category
			expect(assigns(:categories)).to eq(category)
		end

		it "redirects to show page" do
			category = FactoryGirl.create(:category)
			get :show, id: category
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested category to @category" do
			category = FactoryGirl.create(:category)
			get :edit, id: category
			expect(assigns(:categories)).to eq(category)
		end

		it "redirects to edit page" do
			category = FactoryGirl.create(:category)
			get :edit, id: category
			expect(response).to render_template :edit
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the category in the database" do
				expect{
					post :create, category: FactoryGirl.attributes_for(:category)
				}.to change(Category, :count).by(1)	
			end

			it "assigns @category" do
				post :create, category: FactoryGirl.attributes_for(:category)
				expect(assigns(:categories)).to_not be_nil
			end

			it "redirects to index page" do
				post :create, category: FactoryGirl.attributes_for(:category)
				expect(response).to render_template :index
			end
		end	

		context "with invalid attributes" do
			it "does not save the category in the database" do
				expect{
					post :create, category: FactoryGirl.attributes_for(:invalid_category)
				}.to_not change(Category, :count)
			end


			# please check this 
			it "assigns @category to be nil" do
				post :create, category: FactoryGirl.attributes_for(:invalid_category)
				expect(assigns(:invalid_category)).to be_nil
			end

			it "re-renders the new template" do
				post :create, category: FactoryGirl.attributes_for(:invalid_category)
				expect(response).to render_template :new
			end
		end
	end

	describe "DELETE #destroy" do
		let!(:category) { FactoryGirl.create(:category) }
		it "deletes the category from the database" do
			expect {
				delete :destroy, id: category
				}.to change(Category, :count).by (-1)
		end

		it "redirects to index page" do
			delete :destroy, id: category
			expect(response).to redirect_to categories_url
		end
	end

	describe "PUT #update" do
		let!(:category) { FactoryGirl.create(:category, name: "Programming Languages") }
		context "with valid attributes" do
			it "locates the requested @category" do
				put :update, id: category, category: FactoryGirl.attributes_for(:category)
				expect(assigns(:category)).to eq(category)
			end

			it "updates the category in the database" do
				put :update, id: category, category: FactoryGirl.attributes_for(:category, name: "ProgrammingLang")
				category.reload
				expect(category.name).to eq("ProgrammingLang")
			end

			it "redirects to the updated category" do
				put :update, id: category, category: FactoryGirl.attributes_for(:category)
				expect(response).to redirect_to category
			end
		end

		context "with invalid attributes" do
			it "does not update the category" do
				put :update, id: category, category: FactoryGirl.attributes_for(:category, name: nil)
				category.reload
				expect(category.name).to_not be_nil
			end

			it "re-renders the edit page" do
				put :update, id: category, category: FactoryGirl.attributes_for(:category, name: nil)
				expect(response).to render_template("edit")
			end
		end
	end
end
