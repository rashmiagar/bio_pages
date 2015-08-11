# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Skill.delete_all
UserSkill.delete_all
Project.delete_all
User.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!("Category")
ActiveRecord::Base.connection.reset_pk_sequence!("Skill")
ActiveRecord::Base.connection.reset_pk_sequence!("UserSkill")
ActiveRecord::Base.connection.reset_pk_sequence!("Project")
ActiveRecord::Base.connection.reset_pk_sequence!("User")

categories = Category.create([{name: "Gems"}, {name: "Programming Languages"}, {name: "Databases"}, {name: "Frameworks"}, {name: "Deployment Tools"},{name: "Dev Process"},{name: "Other"} ])

categories.each do |category|
	5.times do |i|
      skill = Skill.create({name: "#{category.name}_Skill#{i}", category_id: category.id, description: "This is where the description of the skill will be"} )
      UserSkill.create({user_id: 1, skill_id: skill.id, mastered: true, description: "skill description blah blah" }) if i==1
      
    end
end

FactoryGirl.create(:user)

FactoryGirl.create(:project)

Project.all.each do |project|
	Skill.all.each do |skill|
		project.skills << skill
	end

	User.all.each do |user|
		project.users << user
	end
end