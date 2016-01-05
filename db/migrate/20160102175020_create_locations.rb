class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :latitude, scale: 10, precision: 6
      t.decimal :longitude, scale: 10, precision: 6
      t.references :team, index: true, foreign_key: true

      t.timestamps
    end
  end
end
