# Show short post
# Use for posts index or new feed

class PostLiteSerializer < ActiveModel::Serializer
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :title, :content, :view, :favourite_count, :vote_sum, :comment_count, :image_url, :created_at
  end
end
