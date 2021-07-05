class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :mark
      t.references :movie, foreign_key: true, on_delete: :nullify

      t.timestamps
    end
  end
end
