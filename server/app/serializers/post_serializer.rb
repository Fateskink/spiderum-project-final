class PostSerializer < ActiveModel::Serializer
  attributes :title, :created_at, :content, :view, :favourite_count, :vote_sum, :comment_count

  belongs_to :user
  has_many :comments

  class UserSerializer < ActiveModel::Serializer
    attributes :name
  end

  class CommentSerializer < ActiveModel::Serializer
    attributes :body, :created_at, :vote_sum, :comment_count
    belongs_to :user
    # belongs_to :commentable, polymorphic: true
    # has_many :comments, as: :commentable
    class UserSerializer < ActiveModel::Serializer
      attributes :name
    end
  end
end
