class Vote < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  belongs_to :comments
end
