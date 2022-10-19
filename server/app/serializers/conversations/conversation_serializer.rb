# Show a conversation with all destails
module Conversations
  class ConversationSerializer < ActiveModel::Serializer
    attributes :recipient_id, :sender_id
    has_many :messages, serializer: MessageSerializer
    belongs_to :user, serializer: ::Users::UserLiteSerializer
  end
end
