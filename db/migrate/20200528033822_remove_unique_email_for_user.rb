class RemoveUniqueEmailForUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :user_name, :username
    remove_index :users, :email
    add_index :users, :username
  end
end
