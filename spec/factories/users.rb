FactoryGirl.define do
	factory :user do |u|
		u.name "John"
		#sequence(u.email) { |n| "john#{n}@example.com" }
		u.email "john@example.com"
	end
end