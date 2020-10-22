class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'followedid'
  belongs_to :user, class_name: 'User', foreign_key: 'followerid'
end
