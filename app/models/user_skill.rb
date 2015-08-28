class UserSkill < ActiveRecord::Base
	belongs_to :user
	belongs_to :skill

	validates :user_id, :presence => true
	validates :skill_id, :presence => true
	validates :mastered, :inclusion => {:in => [true, false]}

	#validates :description, :presence => true
	validates_uniqueness_of :user_id, scope: :skill_id, :message => "User has already has this skill in his/her skill set."

	 scope :masters, -> {where(:mastered => true)}
	 scope :learners, -> {where(:mastered => false)}
	 #scope :master_users, -> {User.where(id in masters.pluck(:user_id)).uniq}
	# scope :learner_users, -> {learners.users.uniq}
end
