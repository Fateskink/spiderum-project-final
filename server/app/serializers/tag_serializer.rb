# Show all post with this tag

class TagSerializer < ActiveModel::Serializer
  attributes :tag_name
  has_many :posts
  class Post::PostSerializer < ActiveModel::Serializer
    attributes :id, :title, :content, :view, :favourite_count, :vote_sum, :comment_count, :image_url, :created_at
    class User::UserSerializer < ActiveModel::Serializer
      attributes :name, :image_url
    end
  end
end
