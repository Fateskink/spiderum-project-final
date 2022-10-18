class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # has_many :posts, source: :user
  # has_many :favourite_posts, through: :favourites, source: :user
  has_many :notifications, as: :notificationable
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }
  after_create :create_notifications

  private

  def create_notifications
    Notification.create(recipient: self.post.user, actor: self.user,
                        action: 'favourite', notificationable: self.post)
  end
end
