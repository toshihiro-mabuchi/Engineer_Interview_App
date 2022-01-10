class CreateSelectedmovies < ActiveRecord::Migration[6.1]
  def change
    create_table :selectedmovies do |t|
      t.integer :movie_id
      t.boolean :selected, default: false
      t.integer :pattern_id, default: 0
      t.integer :order_number, default: 0

      t.timestamps
    end
  end
end
