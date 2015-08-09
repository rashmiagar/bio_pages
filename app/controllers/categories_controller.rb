class CategoriesController < ApplicationController
	def index 
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@skills = @category.get_skills_by_category
		respond_to do |format|
		  format.html { render :index }
		  format.js { @skills.to_json}
		  
		end
	end

	def create
		@categories = Category.new(categories_params)
		if @categories.save
			render "index"
		else
			# puts @categorie.errors.messages
			render "new"
		end
	end

	def edit
		@categories = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		begin
			@category.update_attributes!(categories_params)
			redirect_to :action => :show
		rescue ActiveRecord::RecordInvalid => e
			render :edit
		end
	end

	def destroy
		@category = Category.find(params[:id])
		#categorie.delete(@categorie.id)
		@category.destroy
		redirect_to :action => :index
	end

	private 

	def categories_params
		params.require(:category).permit(:name)
	end 
end
