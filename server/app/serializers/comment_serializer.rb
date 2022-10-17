class CommentSerializer < ActiveModel::Serializer
  attributes :body, :created_at, :vote_sum, :show

  belongs_to :post
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :name
  end
end
