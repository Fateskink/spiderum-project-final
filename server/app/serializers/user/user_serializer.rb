# show user's profile
module User
  class UserSerializer < ActiveModel::Serializer
    attributes :name, :email, :image_url
    has_many :posts
  end
end
