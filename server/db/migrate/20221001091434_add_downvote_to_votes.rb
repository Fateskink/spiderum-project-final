class AddDownvoteToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :downvote, :boolean, default: 0
  end
end
