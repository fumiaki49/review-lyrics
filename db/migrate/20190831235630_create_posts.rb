class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string    :song,        null: false, default: ""
      t.string    :singer,      null: false, default: ""
      t.text      :lyric,       null: false
      t.text      :comment,     null: false
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
