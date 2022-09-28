class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      # t.references :user, null: false, foreign_key: true
      # t.references :post, null: false, foreign_key: true
      t.text :comment_body
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false

      t.timestamps
    end
  end
end

