class UserProjectsController < ApplicationController

	before_action :set_project
	def remove
		current_user.projects.delete(@project)
		respond_to do |format|
			format.js
		end
	end

	private
	def set_project
		@project = Project.find(params[:id])
	end
end
