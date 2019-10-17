class User < ApplicationRecord
  has_many :dragqueens, through: :ratings
  has_many :dragqueens, through: :comments
end
