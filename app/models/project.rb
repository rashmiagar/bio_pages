class Project < ActiveRecord::Base
	has_and_belongs_to_many :skills
	has_and_belongs_to_many :users
	validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
	validates :description, :presence => true

	scope :all_except, ->(projects) { where.not(id: projects)}

  before_save :downcase_name

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  private

  def downcase_name
    self.name = name.downcase
  end
end
