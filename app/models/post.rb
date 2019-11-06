class Post < ApplicationRecord
  belongs_to :user
  has_many :talks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :lyric,    length: { in: 1..200 } 
  validates :comment,  length: { in: 1..200 }
end
