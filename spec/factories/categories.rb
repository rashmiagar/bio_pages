# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do |c|
  	c.name "Programming Languages"

  	factory :invalid_category do
  		name nil
  	end
  end
end
