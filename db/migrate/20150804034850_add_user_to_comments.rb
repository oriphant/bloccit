class AddUserToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user, :integer
    add_index :comments, :user
  end
end
