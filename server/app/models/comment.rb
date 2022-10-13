class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votetable, dependent: :destroy
  has_many :users, through: :votes # new vlidate
  has_many :notifications, as: :notificationable, dependent: :destroy
  after_create :create_notifications
  after_create :increment_count
  after_destroy :decrement_count

  private

  def create_notifications
    parent = commentable
    parent = parent.commentable while parent.is_a? Comment
    Notification.create(recipient: commentable.user, actor: user,
                        action: 'commented', notificationable: parent)
  end

  def increment_count
    parent = commentable
    parent = parent.commentable while parent.is_a? Comment
    parent.increment! :comment_count
  end

  def decrement_count
    parent = commentable
    parent = parent.commentable while parent.is_a? Comment
    parent.decrement! :comment_count
  end
end
