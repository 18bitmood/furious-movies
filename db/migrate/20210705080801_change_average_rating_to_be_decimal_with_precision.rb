class ChangeAverageRatingToBeDecimalWithPrecision < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :average_rating, :decimal, default: :null, precision: 4, scale: 2
  end
end
