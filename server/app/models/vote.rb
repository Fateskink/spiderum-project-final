class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votetable, polymorphic: true
  has_many :notifications, as: :notificationable

  # validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :votetable }
  # validates :user, uniqueness: { scope: :comment }
  after_create :create_notifications

  private

  def create_notifications
    Notification.create(recipient: self.votetable.user, actor: self.user,
                        action: 'vote', notificationable: self.votetable)
  end
end
