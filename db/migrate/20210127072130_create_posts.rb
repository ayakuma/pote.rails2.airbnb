class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.date :startday
      t.date :endday
      t.integer :peoples
      t.integer :fee

      t.timestamps
    end
  end
end
