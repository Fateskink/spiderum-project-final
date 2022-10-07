class CreateRankings < ActiveRecord::Migration[7.0]
  def change
    create_table :rankings do |t|
      t.references :favourite, null: false, foreign_key: true
      t.integer :favourite_count, default: 0

      t.timestamps
    end
  end
end
