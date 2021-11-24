class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :comment
      t.text :thumbnail_url
      t.string :youtube_mid
      t.string :youtube_url
      t.string :author_name
      t.integer :pattern_id, default: 0
      t.integer :order_number, default: 0

      t.timestamps
    end
  end
end
