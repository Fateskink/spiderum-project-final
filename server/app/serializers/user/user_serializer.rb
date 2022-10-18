# show user's profile

class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :image_url
  has_many :posts
end
