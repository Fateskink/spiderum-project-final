class PostResultSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_many :comments
  has_many :votes
end
