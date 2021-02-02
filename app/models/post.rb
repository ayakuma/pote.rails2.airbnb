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
  

validate :date_before_start
validate :date_before_finish
  def date_before_start
    return if startday.blank?
    errors.add(:startday, "は今日以降のものを選択してください") if startday < Date.today
  end

  def date_before_finish
    return if endday.blank? || startday.blank?
    errors.add(:endday, "は開始日以降のものを選択してください") if endday < startday
  end

  
end