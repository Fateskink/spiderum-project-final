# Show a list of users

class ListUserSerializer < ActiveModel::Serializer
  class UserSerializer < ActiveModel::Serializer
    attributes :name, :email, :image_url
  end
end
