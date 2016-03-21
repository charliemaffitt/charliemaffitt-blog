class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :raw_body
      t.text :formatted_body
      t.boolean :published, :false
      t.datetime :published_at
      t.timestamps null: false
    end
  end
end
