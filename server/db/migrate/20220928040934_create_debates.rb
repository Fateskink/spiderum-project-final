class CreateDebates < ActiveRecord::Migration[7.0]
  def change
    create_table :debates do |t|
      t.text :comment_content
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
