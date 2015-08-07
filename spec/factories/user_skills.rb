FactoryGirl.define do
	factory :user_skill do |s|
		s.description "worked in many projects using ror"
		s.mastered true
		user
		skill
	end
end