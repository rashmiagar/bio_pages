# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyString"
    client "MyString"
    date_started "2015-08-03"
  end
end