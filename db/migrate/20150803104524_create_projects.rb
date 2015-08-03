class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :client
      t.date :date_started

      t.timestamps null: false
    end
  end
end
