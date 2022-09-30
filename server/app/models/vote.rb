class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votetable, polymorphic: true

  validates :post, uniqueness: { scope: :user }
  validates :comment, uniqueness: { scope: :comment }
  validates :user, uniqueness: { scope: :post }

  def upvote(vote)
    voting << vote unless self == vote
  end

  # downvote
  def downvote(vote)
    voting.delete(vote)
  end
end
