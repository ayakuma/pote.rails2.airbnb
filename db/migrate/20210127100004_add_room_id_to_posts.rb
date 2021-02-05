class AddRoomIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :room_id, :integer
  end
end
