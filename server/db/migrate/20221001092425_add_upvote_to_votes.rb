class AddUpvoteToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :upvote, :boolean, default: 0
  end
end
