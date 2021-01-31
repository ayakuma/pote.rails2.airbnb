class Room < ApplicationRecord
  belongs_to :user
  # has_many :posts, dependent: :destroy
  belongs_to :post
  
  mount_uploader :image, ImageUploader
end
