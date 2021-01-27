class Post < ApplicationRecord
  has_many :user
  has_many :room

  validates :startday, :endday, :peoples, :fee, presence: true 
end
