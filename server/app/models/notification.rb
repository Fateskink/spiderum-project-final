class Notification < ApplicationRecord
  belongs_to :notified_by_id, class_name: 'User'
  belongs_to :user
  belongs_to :notificationable, polymorphic: true
end
