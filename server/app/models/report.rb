class Report < ApplicationRecord
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  validates :user, uniqueness: { scope: :reportable }
  after_create :create_notifications

  private

  def create_notifications
    Notification.create(recipient: User.where(admin: 1), actor: user,
                        action: 'Report', notificationable: reportable)
  end
end
