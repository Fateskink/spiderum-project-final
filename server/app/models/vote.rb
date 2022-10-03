class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votetable, polymorphic: true
  has_many :notifications, as: :notificationable

  # validates :post, uniqueness: { scope: :user }
  # validates :user, uniqueness: { scope: :post }
end
