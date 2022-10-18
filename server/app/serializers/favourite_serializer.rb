# Show list of users who favourited the post which is displayed

class FavouriteSerializer < ActiveModel::Serializer
  belongs_to :post
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :name, :image_url
  end
end
