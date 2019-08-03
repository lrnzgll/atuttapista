class CreateAddressLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :address_locations do |t|
      t.string :address1
      t.string :address2
      t.string :postal_code
      t.string :town
      t.float  :latitude
      t.float  :longitude


      t.timestamps
    end
  end
end
