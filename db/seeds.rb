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

# categories.each do |category|
# 	5.times do |i|
#       skill = Skill.create({name: "#{category.name}_Skill#{i}", category_id: category.id, description: "This is where the description of the skill will be"} )      
#     end
# end

#Gems
category = Category.find_by_name("Gems")
Skill.create({name: "devise", category_id: category.id})
Skill.create({name: "carrierwave", category_id: category.id})
Skill.create({name: "cancancan", category_id: category.id})
#Programming Languages
category = Category.find_by_name("Programming Languages")
Skill.create({name: "ruby", category_id: category.id})
Skill.create({name: "javascript", category_id: category.id})
Skill.create({name: "cc", category_id: category.id})
#Databases
category = Category.find_by_name("Databases")
Skill.create({name: "postgres", category_id: category.id})
Skill.create({name: "mysql", category_id: category.id})
Skill.create({name: "mongodb", category_id: category.id})
#Frameworks
category = Category.find_by_name("Frameworks")
Skill.create({name: "ruby on rails", category_id: category.id})
Skill.create({name: "bootstrap", category_id: category.id})
Skill.create({name: "angular", category_id: category.id})
#Deployment Tools
category = Category.find_by_name("Deployment Tools")
Skill.create({name: "capistrano", category_id: category.id})
Skill.create({name: "mina", category_id: category.id})
Skill.create({name: "whiskey_Disk", category_id: category.id})
#Dev Process
category = Category.find_by_name("Dev Process")
Skill.create({name: "devOps", category_id: category.id})
Skill.create({name: "agile", category_id: category.id})
Skill.create({name: "tdd", category_id: category.id})
#Other
category = Category.find_by_name("Other")
Skill.create({name: "grunt", category_id: category.id})
Skill.create({name: "typeahead", category_id: category.id})
Skill.create({name: "node.js", category_id: category.id})


FactoryGirl.create(:user)

User.all.each do |user|
	Skill.all.each do |skill|
		
		UserSkill.create({user_id: user.id, skill_id: skill.id, mastered: true, description: "skill description blah blah" })
		UserSkill.create({user_id: user.id, skill_id: skill.id, mastered: false, description: "skill description blah blah" })
	end
end


FactoryGirl.create(:project)

Project.all.each do |project|
	Skill.all.each do |skill|
		project.skills << skill
	end

	User.all.each do |user|
		project.users << user
	end
end