class CommentSerializer < ActiveModel::Serializer
  attributes :name, :body, :created_at, :vote_count

  belongs_to :post
  has_many :comments
end
