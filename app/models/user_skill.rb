class UserSkill < ActiveRecord::Base
	belongs_to :user
	belongs_to :skill

	validates :user, :presence => true
	validates :skill, :presence => true
	validates :mastered, :presence => true
	validates :description, :presence => true

	# before_save :assign_default_attributes

	# protected
	# 	def assign_default_attributes
	# 		self.mastered = false
	# 		self.description = ""
	# 	end
end
