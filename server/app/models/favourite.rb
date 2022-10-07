class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :ranking
  has_many :notifications, as: :notificationable
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }
  after_create :create_notifications
  after_create :create_ranking

  private

  def create_notifications
    Notification.create(recipient: post.user, actor: user,
                        action: 'favourite', notificationable: self)
  end

  def create_ranking
    @ranking = @favourite.ranking.find_by(params[:favourite_id])
    if !@ranking
      @ranking = @favourite.rankings.build
      @ranking.update(favourite_count: @ranking.favourite_count + 1)
      @ranking.save
    else
      @ranking.update(favourite_count: @ranking.favourite_count + 1)
    end
  end
end
