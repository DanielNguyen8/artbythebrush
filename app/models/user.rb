class User < ApplicationRecord
  has_many :likes
  has_many :favourites
  has_many :collections
  has_many :follows, as: :record
  has_many :fans, through: :follows
  has_many :artworks
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def followed_items
    Follow.where(fan: self)
  end

end
