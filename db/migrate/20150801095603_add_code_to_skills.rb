class AddCodeToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :code, :string
  end
end
