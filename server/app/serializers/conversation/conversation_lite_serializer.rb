module Conversation
  class ConversationLiteSerializer < ActiveModel::Serializer
    attributes :id
    class User::UserSerializer < ActiveModel::Serializer
      attributes :name, :image_url
    end
  end
end
