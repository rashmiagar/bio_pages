class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :joined_on, :date
  	add_column :users, :education_qualification, :string
  end
end
