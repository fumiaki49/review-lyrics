class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :text, null: false
  end
end
