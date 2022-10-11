class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :created_at, :view, :name, :favourite_count, :vote_sum

  # belongs_to :user
  has_many :comments
  has_many :votes

  def name
    set_post
    @name = @post.users.name
  end

  def vote_sum
    set_post
    @vote_sum = @post.votes.sum(:vote_score)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
