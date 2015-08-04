FactoryGirl.define do
	factory :user do |u|
		u.name "John"
		sequence(:email) { |n| "john#{n}@example.com"}	
	 	
	 	factory :invalid_user do
	 		name nil
	 		email nil
	 	end
	 end
end