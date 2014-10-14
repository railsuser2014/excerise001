class AddFieldsToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :username, :string
    add_column :authors, :password, :string
  end
end
