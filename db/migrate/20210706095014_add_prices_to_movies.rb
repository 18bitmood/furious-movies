class AddPricesToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :price, :integer
  end
end
