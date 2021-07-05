class AddRatingsTotalNumberToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :ratings_total_number, :integer
  end
end
