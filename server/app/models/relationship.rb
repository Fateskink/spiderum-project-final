class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  has_many :notifications, as: :notificationable

  validates :follower_id, presence: true
  validates :followed_id, presence: true
  after_create :create_notifications#, :increment_follow
  # after_destroy :decrement_follow

  private

  def create_notifications
    Notification.create(recipient: self.followed, actor: self.follower,
                        action: 'followed', notificationable: self.follower)
  end

  def increment_follow
    @current_user.increment! :following_count
    @user.increment! :follower_count
  end

  def decrement_follow
    @current_user.decrement! :following_count
    @user.decrement! :follower_count
  end
end
