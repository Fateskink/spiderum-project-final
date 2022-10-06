class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  # has_many_attached :images
  has_one_attached :image
  
  has_many :favourites
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votetable, dependent: :destroy
  has_many :users, through: :votes # new vlidate
  has_many :notifications, as: :notificationable, dependent: :destroy

  default_scope -> { order(created_at: :desc) } # maybe remove when create new sorting
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
                            size: { less_than: 5.megabytes, message: "should be less than 5MB" }
  after_create :create_notifications

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [1000, 1000]) # maybe change image size, dependent on future feature
  end

  # All users is following the post owner
  def recipients
    # @recipients = self.user.followers
    self.user.followers
  end

  def create_notifications
    recipients.each do |recipient|
      Notification.create(recipient: recipient, actor: self.user,
        action: 'posted', notificationable: self)
    end
  end
end
