class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votetable, dependent: :destroy
  has_many :users, through: :votes # new vlidate
  has_many :notifications, as: :notificationable, dependent: :destroy
  after_create :create_notifications

  private

  def create_notifications
    Notification.create(recipient: self.commentable.user, actor: self.user,
                        action: 'commented', notificationable: self)
  end
end
