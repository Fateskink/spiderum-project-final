class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :vote_score
      t.references :users, null: false, foreign_key: true
      t.references :votetable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
