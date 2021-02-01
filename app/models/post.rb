class Post < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # has_many :users, dependent: :destroy
  # has_many :rooms, dependent: :destroy

  with_options presence: true do
    validates :startday
    validates :endday
    validates :peoples
  end

  # validates :startday, :endday, :peoples, presence: true 

  validates :peoples, numericality:{ greater_than_or_equal_to: 1 }

  
end