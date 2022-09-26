class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  default_scope -> { order(created_at: :desc) } # maybe remove when create new sorting
  validates :user_id, presence: true
  validates :content, presence: true
end
