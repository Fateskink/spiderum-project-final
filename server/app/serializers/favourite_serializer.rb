class FavouriteSerializer < ActiveModel::Serializer
  attributes :id
  # belongs_to :user
  belongs_to :post, serializer: PostSerializer

  # class PostSerializer < ActiveModel::Serializer
  #   # attributes :title
  #   # class UserSerializer < ActiveModel::Serializer
  #   #   attributes :name
  #   # end
  # end
end
