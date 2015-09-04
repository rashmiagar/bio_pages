# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "Scripbox"
    description "Mutual fund portal"
    client "Scripbox"
    date_started "2015-08-03"

    factory :invalid_project do
    	name nil
    	description nil
    end
  end
end
