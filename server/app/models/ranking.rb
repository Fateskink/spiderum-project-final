class Ranking < ApplicationRecord
  belongs_to :favourite
  belongs_to :post

  # @post.readers.where('reader_links.created_at >= ?', 45.minutes.ago).any?
  # ranking.posts.where('created_at >=?', 1.month.ago)
  # post.readers.where('created_at >= ?', 5.minutes.ago)
  # clean ranking when time out (1 month)
  # def clean
  #   time_range = (Time.now.midnight - 1.month)..Time.now.midnight
  #   @posts = Post.joins(:rankings)
  #                .select('rankings.*, COUNT(posts.id) as ranking')
  #                .group('rankings.id')
  #                .where('posts.created_at' => time_range)
  #                .order('ranking DESC')
  #                .limit(10)
  # end
end
