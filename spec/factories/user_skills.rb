FactoryGirl.define do
	factory :user_skill do |skill|
		skill.description "worked in many projects using ror"
		skill.mastered true
		user
		skill

		factory :invalid_user_skill do
	 		user nil
	 		skill nil
	 	end
	end
end