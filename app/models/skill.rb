class Skill < ActiveRecord::Base
	has_many :user_skills

	has_many :users, :through => :user_skills
	belongs_to :category
	has_and_belongs_to_many :projects
	
	validates :name, :presence => true, :uniqueness => {:case_sensitive => false}

	validates :category_id, presence: true
	#validates :code, presence: true

	accepts_nested_attributes_for :projects

	#CODE_REGEXP = /[A-Z]+[_]*/
	#validates :code, format: { with: CODE_REGEXP }

    #scope :masters, -> includes(:users).where("users.user_skills.where(mastered => true)}

	# before_save :generate_code
	before_save { self.name = name.downcase }

	def generate_code
		#all CAPS and snake case of name attribute
		self.code = name.upcase.gsub(" ", "_")
		#update_attributes(:code => code)
	end

	def user_skill(user_id)
		UserSkill.find_by_user_id_and_skill_id(user_id, self.id)
	end

	def user_with_skill_learning_level(learning_level)
	  user_skills = UserSkill.where(:skill_id => self.id, :mastered => learning_level == "mastered" ? true : false)
	  return User.where(:id => user_skills.flatten.map(&:user_id))
	end

	def self.search(query)
		eager_load(:category).where('skills.name like ?', "%#{query}%")
	end
end