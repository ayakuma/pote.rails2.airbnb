class Post < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :startday, :endday, :peoples, :fee, presence: true 
end