class CommentSerializer < ActiveModel::Serializer
  attributes :name, :body, :created_at, :vote_count

  belongs_to :post
  has_many :comment

  def name
    set_cmt
    @name = @comment.users.name
  end

  def set_cmt
    @comment = Comment.find(params[:id])
  end
end
