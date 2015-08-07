FactoryGirl.define do
	factory :user do |u|
		u.name "John"
		#sequence(u.email) { |n| "john#{n}@example.com" }
		sequence(:email) { |n| "john#{n}@example.com"}	
		#u.email "john@example.com"
		#skill

	# 	factory :list_with_many_skills do
	# 		after(:create) do |list, evaluator|
	# 			create_list(:skill, evaluator.skills.count, list)
	# 		end
	# 	end
	 end
end