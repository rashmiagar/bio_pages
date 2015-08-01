class AddAbbreviationToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :abbreviation, :string
  end
end
