class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, as: :notificationable
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }
end
