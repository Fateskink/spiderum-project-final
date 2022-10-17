class MessageSerializer < ActiveModel::Serializer
  attributes :mes_content, :user_id, :conversation_id, :created_at
  belongs_to :conversation
end
