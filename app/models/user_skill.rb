class UserSkill < ActiveRecord::Base
	belongs_to :user
	belongs_to :skill

	validates :user_id, :presence => true
	validates :skill_id, :presence => true
	validates :mastered, :presence => true

	
end
