class CreateTowns < ActiveRecord::Migration[5.2]
  def change
    create_table :towns do |t|
      t.string :name
      t.integer :population
      t.references :county, foreign_key: true
      t.references :region, foreign_key: true
      t.st_point :lonlat, geographic: true
      t.timestamps
    end
    add_index :towns, :name
  end
end
