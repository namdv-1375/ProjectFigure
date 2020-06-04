class AddColumnForUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :address, :string
    add_column :users, :tel, :string
  end
end
