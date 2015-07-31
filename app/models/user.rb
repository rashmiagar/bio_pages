class User < ActiveRecord::Base
	attr_accessor :email_regexp
  	@@email_regexp = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates :name, presence: true, length:{ maximum: 50 }
	validates :email, presence: true, uniqueness: true, format: { with: @@email_regexp, 
		message: "not an email" }


end
