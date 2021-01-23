class AddColumnsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :startday, :date
    add_column :rooms, :endday, :date
  end
end
