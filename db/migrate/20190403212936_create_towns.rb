class CreateTowns < ActiveRecord::Migration[5.2]
  def change
    create_table :towns do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.references :county, foreign_key: true

      t.timestamps
    end
  end
end
