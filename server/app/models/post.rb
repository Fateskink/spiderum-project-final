class Post < ApplicationRecord
  belongs_to :user
  # has_many_attached :images
  has_one_attached :image

  has_many :tag_lists, through: :taggings
  has_many :taggings, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :votants, through: :votes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  default_scope -> { order(created_at: :desc) } # maybe remove when create new sorting
  validates :user_id, presence: true
  validates :content, presence: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
                            size: { less_than: 5.megabytes, message: "should be less than 5MB" }

  def score
    votes.count
  end

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [1000, 1000]) # maybe change image size, dependent on future feature
  end

end
