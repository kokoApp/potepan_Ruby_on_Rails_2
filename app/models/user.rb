class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
         has_many :reserves
         attachment :profile_image

         validates :name, presence: true
         validates :profile_image, presence: true
         validates :profile, presence: true
end
