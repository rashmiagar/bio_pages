FactoryGirl.define do
	factory :user_skill do |skill|
		skill.description "worked in many projects using ror"
		skill.mastered true
		user
		skill
	end
end