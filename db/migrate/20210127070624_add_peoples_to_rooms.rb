class AddPeoplesToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :peoples, :integer
    add_column :rooms, :fee, :integer
  end
end
