class AddRoomNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :room_name, :string
    add_column :posts, :room_image, :string
    add_column :posts, :room_introduction, :text
  end
end
