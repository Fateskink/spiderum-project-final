class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :votes, default: 0
      t.references :users, null: false, foreign_key: true
      t.references :posts, null: false, foreign_key: true
      t.references :comments, null: false, foreign_key: true

      t.timestamps
    end
  end
end
