class User < ActiveRecord::Base
	has_many :user_skills
	has_many :skills, :through => :user_skills

  	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates :name, presence: true, length:{ maximum: 50 }
	validates :email, presence: true, uniqueness: {:case_sensitive => false}, format: { with: EMAIL_REGEXP, 
		message: "not an email" }


end
