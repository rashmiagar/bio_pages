# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Skill.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!("Category")

categories = Category.create([{name: "Gems"}, {name: "Programming Languages"}, {name: "Databases"}, {name: "Frameworks"}, {name: "Deployment Tools"},{name: "Dev Process"},{name: "Other"} ])

categories.each do |category|
	5.times do |i|
      Skill.create({name: "#{category.name}_Skill#{i}", category_id: category.id, description: "description blah blah blah"} )
    end
end

UserSkill.create({user_id: 1})