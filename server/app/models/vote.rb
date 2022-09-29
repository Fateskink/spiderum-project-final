class Vote < ApplicationRecord
  belongs_to :users
  belongs_to :votetable, polymorphic: true

  validates :post, uniqueness: { scope: :user }
  validates :comment, uniqueness: { scope: :comment }
  validates :user, uniqueness: { scope: :post }
end
