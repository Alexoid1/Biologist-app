class User < ApplicationRecord
  validates :fullname, presence: true
  validates :username, presence: true
  validates_uniqueness_of :username
  has_many :opinions, foreign_key: 'authorid', class_name: 'Opinion'
  has_many :followings
  has_many :followers, foreign_key: 'followerid', class_name: 'Following'
  has_many :follows, foreign_key: 'followedid', class_name: 'Following'
  has_many :species

  scope :not_follow, ->(user) { where.not(id: user.followers.map(&:followedid)) }
end
