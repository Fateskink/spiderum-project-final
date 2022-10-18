class CommentSerializer < ActiveModel::Serializer
  attributes :body, :created_at, :vote_sum

  belongs_to :post
  belongs_to :user
  class User::UserSerializer < ActiveModel::Serializer
    attributes :name
  end
end
