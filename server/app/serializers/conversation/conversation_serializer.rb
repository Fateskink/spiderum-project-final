# Show a conversation with all destails
module Conversation
  class ConversationSerializer < ActiveModel::Serializer
    attributes :recipient_id, :sender_id
    has_many :messages
    belongs_to :user

    class MessageSerializer < ActiveModel::Serializer
      attributes :mes_content, :user_id, :conversation_id, :created_at
      class User::UserSerializer < ActiveModel::Serializer
        attributes :name, :image_url
      end
    end
  end
end
