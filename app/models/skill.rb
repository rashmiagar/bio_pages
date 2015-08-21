class Skill < ActiveRecord::Base
	has_many :user_skills
	
	has_many :users, :through => :user_skills
	belongs_to :category
	has_and_belongs_to_many :projects

	validates :name, presence: true
	validates :category_id, presence: true
	#validates :code, presence: true

	accepts_nested_attributes_for :projects

	#CODE_REGEXP = /[A-Z]+[_]*/
	#validates :code, format: { with: CODE_REGEXP }

	before_save :generate_code

	def generate_code
		#all CAPS and snake case of name attribute
		self.code = name.upcase.gsub(" ", "_")
		#update_attributes(:code => code)
	end

	def user_skill(user_id)
		UserSkill.find_by_user_id_and_skill_id(user_id, self.id)
	end

end