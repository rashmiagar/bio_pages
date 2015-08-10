class Category < ActiveRecord::Base
	has_many :skills

	validates :name, :presence => true

	before_save :generate_code

	def generate_code
		#all CAPS and underscore for spaces
		self.code = name.upcase.gsub(" ", "_")
		#update_attributes(:code => code)
	end

	def get_skills_by_category
		self.skills.all
	end

end
