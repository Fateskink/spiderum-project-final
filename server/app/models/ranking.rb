class Ranking < ApplicationRecord
  belongs_to :post
  has_many :favourites

  # @post.readers.where('reader_links.created_at >= ?', 45.minutes.ago).any?
  # ranking.posts.where('created_at >=?', 1.month.ago)
  # post.readers.where('created_at >= ?', 5.minutes.ago)
  # clean ranking when time out (1 month)

end
