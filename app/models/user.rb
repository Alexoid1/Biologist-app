class User < ApplicationRecord
  validates :fullname, presence: true
  validates_uniqueness_of :username
  has_many :opinions
  has_many :followings
  has_many :followers, foreign_key: 'follower_id', class_name: 'Following'
  has_many :follows, foreign_key: 'followed_id', class_name: 'Following'
  
  


  scope :not_follow, ->(user) { where.not(id: (user.followers).map(&:followed_id)) }
  
end
