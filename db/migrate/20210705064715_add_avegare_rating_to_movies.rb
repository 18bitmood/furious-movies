class AddAvegareRatingToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :average_rating, :decimal, default: 0
  end
end
