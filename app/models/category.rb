class Category < ActiveRecord::Base
	has_many :skills

	validates :name, :presence => true

	before_save :generate_code

	def generate_code
		#all CAPS and snake case of name attribute
		self.code = name.upcase.gsub(" ", "_")
		#update_attributes(:code => code)
	end

end
