# Show list of notifications

class NotificationableSerializer < ActiveModel::Serializer
  attributes :recipient_id, :actor_id, :notificationable_type, :notificationable_id, :action, :created_at
end