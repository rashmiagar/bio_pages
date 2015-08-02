class Skill < ActiveRecord::Base
	has_many :user_skills
	has_many :users, :through => :user_skills
	belongs_to :category

	validates :name, presence: true
	validates :category_id, presence: true
end
