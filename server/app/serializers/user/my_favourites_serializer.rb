class MyFavouritesSerializer < ActiveModel::Serializer
  class FavouriteSerializer < ActiveModel::Serializer
    belongs_to :post
    class PostSerializer < ActiveModel::Serializer
      attributes :id, :title, :content, :view, :favourite_count, :vote_sum, :comment_count, :image_url, :created_at
    end
  end
end
