class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :car_positions do |t|
      t.string :lat
      t.string :long
      t.references :car, index: true

      t.timestamps
    end
  end
end
