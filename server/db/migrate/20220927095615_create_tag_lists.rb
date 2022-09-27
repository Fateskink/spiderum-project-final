class CreateTagLists < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_lists do |t|
      t.string :tag_name

      t.timestamps
    end
    add_index :tag_lists, :tag_name, unique: true
  end
end
