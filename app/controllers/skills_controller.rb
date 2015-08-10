class SkillsController < ApplicationController
	def index 
		@skills = Skill.all
	end

	def show
		@skill = Skill.find(params[:id])
		
		respond_to do |format|
			format.js {}
		  format.html { render layout: !request.xhr? }
		end

	end

	def show_by_category
		@skills = Skill.find_by_category_id(params[:category_id])
		render "index"
	end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skill_params)
		if @skill.save
			render "index"
		else
			# puts @skill.errors.messages
			render "new"
		end
	end

	def edit
		@skill = Skill.find(params[:id])
	end

	def update
		@skill = Skill.find(params[:id])
		begin
			@skill.update_attributes!(skill_params)
			redirect_to :action => :show
		rescue ActiveRecord::RecordInvalid => e
			render :edit
		end
	end

	def destroy
		@skill = Skill.find(params[:id])
		#skill.delete(@skill.id)
		@skill.destroy
		redirect_to :action => :index
	end

	private 

	def skill_params
		params.require(:skill).permit(:name, :category_id)
	end 
end
