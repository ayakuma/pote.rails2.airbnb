class Room < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, :address, :price, :introduction, :image, presence: true 
  validates :introduction, length: { maximum: 200 } 
  validates :price, numericality:{ greater_than_or_equal_to: 1 }
  validates :introduction,:address,    length: { minimum: 5 } 

  
  mount_uploader :image, ImageUploader

end
