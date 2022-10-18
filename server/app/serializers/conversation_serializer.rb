class ConversationSerializer < ActiveModel::Serializer
  attributes :recipient_id, :sender_id
  has_many :messages #, serializer: MessageSerializer
  
  class MessageSerializer < ActiveModel::Serializer
    attributes :mes_content, :user_id, :conversation_id, :created_at
  end
end
