# Show a single post with all details
module Post
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :title, :content, :view, :favourite_count, :vote_sum, :comment_count, :image_url, :created_at

    belongs_to :user
    belongs_to :tag
    has_many :comments

    class UserSerializer < ActiveModel::Serializer
      attributes :name
    end

    # class CommentSerializer < ActiveModel::Serializer
    #   attributes :id, :body, :created_at, :vote_sum, :show
    #   belongs_to :user
    #   has_many :comments, serializer: CommentSerializer

    #   class UserSerializer < ActiveModel::Serializer
    #     attributes :name
    #   end
    # end
  end
end
