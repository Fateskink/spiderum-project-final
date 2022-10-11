class ListUserSerializer < ActiveModel::Serializer
  class UserSerializer < ActiveModel::Serializer
    attributes :name, :email
  end
end
