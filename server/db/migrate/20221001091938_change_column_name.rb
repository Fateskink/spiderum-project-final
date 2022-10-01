class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :votes, :vote_score, :upvote
  end
end
