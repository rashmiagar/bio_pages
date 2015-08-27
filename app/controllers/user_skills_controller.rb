class UserSkillsController < ApplicationController

	def update
		@user_skill = UserSkill.find(params[:id].to_i)
		#binding.pry
		@user_skill.update_attribute(:mastered, params["bio_pic_pages"]["user_skills"][@user_skill.id.to_s]["mastered"])
		
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@user_skill = UserSkill.find(params[:id])
			
		@user_skill.destroy
		respond_to do |format|
			format.js
		end
	end
end
