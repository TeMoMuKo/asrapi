class AddAddressCountryCountryCodeToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address, :string
    add_column :locations, :country, :string
    add_column :locations, :country_code, :string
  end
end
