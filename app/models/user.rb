class User < ApplicationRecord
  has_many :opinions
  has_many :followings
  has_many :followers, foreign_key: 'follower_id', class_name: 'Following'
  has_many :follows, foreign_key: 'followed_id', class_name: 'Following'

  scope :follow_by, -> { joins(user).where() }
end
