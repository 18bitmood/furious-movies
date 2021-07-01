class RemovePriceFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :price, :decimal
  end
end
