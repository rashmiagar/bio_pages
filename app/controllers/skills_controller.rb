class SkillsController < ApplicationController
	def index 
		@skills = Skill.all
		@hash = @skills.group_by(&:category)
		puts @hash.inspect
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

	def typeahead
    	puts "In controller ***********"
      render json: Skill.where('name ilike ?', "%#{params[:query]}%")
    end

	private 

	def skill_params
		params.require(:skill).permit(:name, :category_id)
	end 


	# def typeahead
 #     render json: Skill.where(name: params[:query])
 #    end


end
