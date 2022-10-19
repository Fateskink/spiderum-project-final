module Conversations
  class ConversationLiteSerializer < ActiveModel::Serializer
    attributes :id
    belongs_to :user, serializer: ::Users::UserLiteSerializer
  end
end
