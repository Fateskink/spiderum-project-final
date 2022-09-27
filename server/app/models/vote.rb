class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :comment

  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }
  validates :user, uniqueness: { scope: :comment }
end
