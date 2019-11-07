class Post < ApplicationRecord
  belongs_to :user
  has_many :talks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :song, presence: true, length: { maximum: 40 }
  validates :singer, presence: true, length: { maximum: 20 }
  validates :lyric, presence: true,   length: { maximum: 200 } 
  validates :comment,  presence: true, length: { maximum: 200 }
end
