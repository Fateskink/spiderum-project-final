class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamps null: false
    end
    add_index :taggings, :tag_id
    add_index :taggings, [:tag_id, :post_id], unique: true
  end
end
