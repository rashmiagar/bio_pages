FactoryGirl.define do
	factory :skill do |s|
		s.name "ruby on rails"
		s.description "a mvc framework in ruby"
		s.abbreviation "ROR"
		sequence(:category_id) {|n| n}
		
		factory :invalid_skill do
			name nil
			category_id nil
		end
	end
end