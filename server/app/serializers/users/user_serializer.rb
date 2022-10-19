# show user's profile
module Users
  class UserSerializer < ActiveModel::Serializer
    attributes :name, :email, :image_url
    has_many :posts, serializer: ::Posts::PostLiteSerializer
  end
end
