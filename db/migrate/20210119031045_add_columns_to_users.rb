class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pass, :string
    add_column :users, :introduction, :string
    add_column :users, :img, :string
  end
end
