class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votetable, polymorphic: true

  # validates :post, uniqueness: { scope: :user }
  # validates :user, uniqueness: { scope: :post }
end
