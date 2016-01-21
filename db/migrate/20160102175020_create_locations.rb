class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :latitude, precision: 10, scale:6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :message, null: false, default: ""
      t.references :team, index: true, foreign_key: true

      t.timestamps
    end
  end
end
