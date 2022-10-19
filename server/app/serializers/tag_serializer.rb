class TagSerializer < ActiveModel::Serializer
  attributes :tag_name
  has_many :posts
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :title, :content, :view, :favourite_count, :vote_sum, :comment_count, :image_url, :created_at  
    class UserSerializer < ActiveModel::Serializer
      attributes :name
    end
  end
end