class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.decimal :budget, precision: 8, scale: 2
      t.boolean :published
      t.boolean :closed
      t.date :target_date
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
