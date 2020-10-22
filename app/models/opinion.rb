class Opinion < ApplicationRecord
  validates :opinion, presence: true, length: { maximum: 1000,
                                                too_long: '1000 characters in post is the maximum allowed.' }
  belongs_to :user
end
