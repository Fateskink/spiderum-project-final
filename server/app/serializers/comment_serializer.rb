class CommentSerializer < ActiveModel::Serializer
  attributes :body, :created_at, :vote_sum, :comment_count

  belongs_to :post
  # has_many :comments
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :name
  end

  # def name
  #   object.users.name
  # end
end
