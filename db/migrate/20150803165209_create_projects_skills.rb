class CreateProjectsSkills < ActiveRecord::Migration
  def change
    create_table :projects_skills do |t|
    	t.integer :project_id
    	t.integer :skill_id
    end
  end
end
