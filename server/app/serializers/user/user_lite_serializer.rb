class UserLiteSerializer < ActiveModel::Serializer
  class UserSerializer < ActiveModel::Serializer
    attributes :image_url, :name
  end
end
