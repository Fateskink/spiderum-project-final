# Show a list of users

class ListUserSerializer < ActiveModel::Serializer
  class User::UserSerializer < ActiveModel::Serializer
    attributes :name, :email, :image_url
  end
end
