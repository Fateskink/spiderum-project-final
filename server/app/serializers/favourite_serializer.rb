class FavouriteSerializer < ActiveModel::Serializer
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :name
    class PostSerializer < ActiveModel::Serializer
      attributes :title
    end
  end
end
