class FavouriteSerializer < ActiveModel::Serializer
  # attributes :id
  belongs_to :post, serializer: PostSerializer

end
