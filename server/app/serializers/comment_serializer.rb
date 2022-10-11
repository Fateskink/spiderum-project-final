class CommentSerializer < ActiveModel::Serializer
  attributes :user_id, :body

  has_many :commentable
  belongs_to :post
end
