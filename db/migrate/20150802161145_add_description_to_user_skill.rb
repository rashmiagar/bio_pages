class AddDescriptionToUserSkill < ActiveRecord::Migration
  def change
    add_column :user_skills, :description, :string
  end
end
