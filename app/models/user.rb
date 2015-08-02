class User < ActiveRecord::Base
	has_many :user_skills
	has_many :skills, :through => :user_skills

	attr_accessor :email_regexp
  	@@email_regexp = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates :name, presence: true, length:{ maximum: 50 }
	validates :email, presence: true, uniqueness: {:case_sensitive => false}, format: { with: @@email_regexp, 
		message: "not an email" }


end
