class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notificationable, polymorphic: true, null: false
      t.integer :notified_by_id, null: false
      t.boolean :read, default: false
      t.boolean :checked, default: false

      t.timestamps
    end
    add_index :notifications, :notified_by_id
    add_index :notifications, ["notificationable_id", "notificationable_type"], :name => "fk_notificationables"
    add_index :notifications, [:read, :checked]
  end
end
