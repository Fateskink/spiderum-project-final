class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :vote_sum

  belongs_to :user, serializer: ::Users::UserLiteSerializer
end
