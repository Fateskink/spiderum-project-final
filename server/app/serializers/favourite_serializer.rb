class FavouriteSerializer < ActiveModel::Serializer
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :name
  end
end
