# Show list of users who favourited the post which is being displayed

class FavouriteSerializer < ActiveModel::Serializer
  belongs_to :post
  belongs_to :user
  class User::UserSerializer < ActiveModel::Serializer
    attributes :name, :image_url
  end
end
