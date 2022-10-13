class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :view, :favourite_count, :vote_sum, :comment_count

  belongs_to :user
  has_many :comments

  class UserSerializer < ActiveModel::Serializer
    attributes :name
  end

  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :body, :created_at, :vote_sum, :comment_count
    belongs_to :user
    has_many :comments, serializer: CommentSerializer

    class UserSerializer < ActiveModel::Serializer
      attributes :name
    end
  end
end
