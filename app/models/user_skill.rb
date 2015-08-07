class UserSkill < ActiveRecord::Base
	belongs_to :user
	belongs_to :skill

	validates :user, :presence => true
	validates :skill, :presence => true
	validates :mastered, :presence => true
	validates :description, :presence => true
end
