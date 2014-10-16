class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :project_id
      t.integer :user_id
      t.decimal :amount
      t.text :desc

      t.timestamps
    end
  end
end
