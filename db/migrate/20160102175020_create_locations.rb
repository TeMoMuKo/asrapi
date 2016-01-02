class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal10 :latitude
      t.decimal6 :latitude
      t.decimal10 :longitude
      t.decimal6 :longitude
      t.references :team, index: true, foreign_key: true

      t.timestamps
    end
  end
end
