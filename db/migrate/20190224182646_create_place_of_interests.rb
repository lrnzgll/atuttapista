class CreatePlaceOfInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :place_of_interests do |t|
      t.string :name
      t.text :description
      t.references :county, foreign_key: true

      t.timestamps
    end
  end
end
