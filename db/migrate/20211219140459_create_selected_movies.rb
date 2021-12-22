class CreateSelectedMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :selected_movies do |t|
      t.integer :movie_id

      t.timestamps
    end
  end
end
