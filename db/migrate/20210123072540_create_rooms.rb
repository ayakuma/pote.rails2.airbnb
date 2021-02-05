class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.text :introduction
      t.string :price
      t.string :integer
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
