FactoryGirl.define do
	email = Faker::Internet.email
	factory :user do |u|
		u.name "John"
		u.email Faker::Internet.email	
	 	
	 	factory :invalid_user do
	 		name nil
	 		email nil
	 	end
	 end
end