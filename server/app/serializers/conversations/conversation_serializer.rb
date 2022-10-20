# Show a conversation with all destails
module Conversations
  class ConversationSerializer < ActiveModel::Serializer
    attributes :id, :recipient, :sender
    has_many :messages, serializer: MessageSerializer
    # belongs_to :user, serializer: ::Users::UserLiteSerializer
  end
end
