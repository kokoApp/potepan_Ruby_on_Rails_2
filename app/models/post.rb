class Post < ApplicationRecord
  attachment :image

  belongs_to :user, optional: true
  has_many :reserves

  validates :hotel, presence: true
  validates :place, presence: true
  validates :explantion, presence: true
  validates :price, presence: true
  
end
