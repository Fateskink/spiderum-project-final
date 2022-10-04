class PostResultSerializer < ActiveModel::Serializer
  attributes :title, :content

  belongs_to :user
  has_many :comments
  has_many :votes
  has_many :favourite
end
