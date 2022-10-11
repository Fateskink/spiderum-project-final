class CommentSerializer < ActiveModel::Serializer
  attributes :body, :created_at, :vote_count

  belongs_to :post
  # has_many :comment

  class UserSerializer < ActiveModel::Serializer
    attributes :name
  end
end
