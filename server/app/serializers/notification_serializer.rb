# Show list of notifications

class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :recipient_id, :actor_id, :notificationable_type, :notificationable_id, :action, :created_at
end