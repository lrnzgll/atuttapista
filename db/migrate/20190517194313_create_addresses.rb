class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :address_location, foreign_key: true
      t.time :archived_at
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
