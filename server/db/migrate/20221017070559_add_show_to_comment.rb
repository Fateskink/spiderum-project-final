class AddShowToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :show, :boolean, default: false
  end
end
