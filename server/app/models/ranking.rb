class Ranking < ApplicationRecord
  belongs_to :favourite
  belongs_to :post

  # clean ranking when time out (1 month)
  # def clean
  #   time_range = (Time.now.midnight - 1.month)..Time.now.midnight
  #   @posts = Post.joins(:favourite)
  #                .select('favourites.*, COUNT(posts.id) as ranking')
  #                .group('favourites.id')
  #                .where('posts.created_at' => time_range)
  #                .order('ranking DESC')
  #                .limit(10)
  #   render json: @posts, status: :ok
  # end
end
