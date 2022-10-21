# Show a single post with all details
module Posts
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :title, :content, :view, :favourite_count, :vote_sum, :comment_count, :images_url, :created_at

    belongs_to :user, serializer: ::Users::UserLiteSerializer
    belongs_to :tag, serializer: ::AttachTagSerializer
    # has_many :comments, serializer: ::CommentSerializer

    # class User::UserLiteSerializer < ActiveModel::Serializer
    #   attributes :name, :image_url
    # end

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
