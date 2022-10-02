class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :ranking
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }
end
