class Post < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # has_many :users, dependent: :destroy
  # has_many :rooms, dependent: :destroy

  validates :startday, :endday, :peoples, :fee, presence: true 
  
end