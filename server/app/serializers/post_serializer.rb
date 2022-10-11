class PostSerializer < ActiveModel::Serializer
  attributes :title, :created_at, :content,  :view, :favourite_count, :vote_sum

  belongs_to :user
  has_many :comments

  class UserSerializer < ActiveModel::Serializer
    attributes :name
  end
  # def name
  #   object.users.name
  # end
end
