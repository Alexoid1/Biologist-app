class User < ApplicationRecord
  has_many :opinions, foreign_key: :author_id
end
