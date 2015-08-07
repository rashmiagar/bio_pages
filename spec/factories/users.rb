FactoryGirl.define do
	factory :user do |u|
		u.name "John"
		sequence(:email) { |n| "john#{n}@example.com"}	
	 end
end