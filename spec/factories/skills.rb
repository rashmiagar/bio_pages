FactoryGirl.define do
	factory :skill do |s|
		s.name "ruby on rails"
		s.description "a mvc framework in ruby"
		s.abbreviation "ROR"
		s.category_id 1
	end
end