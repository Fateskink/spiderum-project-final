class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, as: :notificationable
  has_one :ranking
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }
  after_create :create_notifications

  private

  def create_notifications
    Notification.create(recipient: self.post.user, actor: self.user,
                        action: 'favourite', notificationable: self)
  end
end
