class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.time :archived_at
      t.references :addressable, polymorphic: true
      t.string :address1
      t.string :address2
      t.string :postal_code
      t.references :region
      t.references :county
      t.references :town
      t.st_point :lonlat, geographic: true

      t.timestamps
    end
  end
end
