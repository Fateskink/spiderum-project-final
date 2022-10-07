class AddRankingToFavourite < ActiveRecord::Migration[7.0]
  def change
    add_reference :favourites, :ranking, null: false, foreign_key: true
  end
end
