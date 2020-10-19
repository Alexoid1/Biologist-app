class User < ApplicationRecord
  has_many :opinions
  has_many :followings
  has_many :followers, foreign_key: 'follower_id', class_name: 'Following'
end
