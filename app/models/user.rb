class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :profile
end