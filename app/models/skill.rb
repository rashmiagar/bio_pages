class Skill < ActiveRecord::Base
	has_many :user_skills
	has_many :users, :through => :user_skills
	belongs_to :category
	has_and_belongs_to_many :projects

	validates :name, presence: true
	validates :category_id, presence: true
	#validates :code, presence: true

	#CODE_REGEXP = /[A-Z]+[_]*/
	#validates :code, format: { with: CODE_REGEXP }

    #scope :masters, -> includes(:users).where("users.user_skills.where(mastered => true)}

	before_save :generate_code

	def generate_code
		#all CAPS and snake case of name attribute
		self.code = name.upcase.gsub(" ", "_")
		#update_attributes(:code => code)
	end

	def masters
	  self.users.each do |user|
        user.user_skills.where(mastered:true)
	  end
	end

	def learners
		result = []
	  self.users.each do |user|
        result << user.user_skills.where(mastered:false)
	  end
	  return result
	end
end