class Species < ApplicationRecord
  validates :specie, presence: true
  validates :content, presence: true
  validates :image, presence: true
  validates :location, presence: true
  belongs_to :user
end
