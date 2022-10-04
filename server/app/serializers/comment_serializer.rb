class CommentSerializer < ActiveModel::Serializer
  attributes :body

  has_many :commentable
  belongs_to :post
end
