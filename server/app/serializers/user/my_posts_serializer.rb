# Show all current user's post
module User
  class MyPostsSerializer < ActiveModel::Serializer
    class PostSerializer < ActiveModel::Serializer
      attributes :id, :title, :content, :view, :favourite_count, :vote_sum, :comment_count, :image_url, :created_at
    end
  end
end
