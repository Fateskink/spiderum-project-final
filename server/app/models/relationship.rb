class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # has_many :notifications, as: :notificationable
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  has_many :notifications, as: :notificationable
  after_create :create_notifications

  private

  def create_notifications
    Notification.create(recipient: self.followed, actor: self.follower,
                        action: 'followed', notificationable: self)
  end
end
