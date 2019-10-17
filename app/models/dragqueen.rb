class Dragqueen < ApplicationRecord
  has_many :users, through: :ratings
  has_many :users, through: :comments
end
