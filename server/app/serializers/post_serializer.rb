class PostSerializer < ActiveModel::Serializer
  attributes :title, :name, :created_at, :content,  :view, :favourite_count, :vote_sum

  # belongs_to :user
  has_many :comments
  has_many :votes

  def name
    set_post
    @name = @post.users.name
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
