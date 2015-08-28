class ProjectsController < ApplicationController

	def index 
		@projects = Project.all
		
	end

	def show
		@project = Project.find(params[:id])

	end

	def create
		# binding.pry
		@project = Project.new(project_params)
		if @project.save
		respond_to do |format|
			format.js
		end
		else
			render 'new'
		end 
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		begin
			@project.update_attributes!(project_params)
			redirect_to :action => :show
		rescue ActiveRecord::RecordInvalid => e
			render :edit
		end
	end

	def destroy
		@project = Project.find(params[:id])
		#project.delete(@project.id)
		@project.destroy
		redirect_to :action => :index
	end

	private 

	def project_params
		params.require(:project).permit(:name, :description, :client, :date_started)
	end 
end
