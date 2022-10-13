class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :admin, :banned
  has_many :posts
end
