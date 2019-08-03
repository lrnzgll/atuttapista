class CreateTowns < ActiveRecord::Migration[5.2]
  def change
    create_table :towns do |t|
      t.string :name
      t.string :slug
      t.string :zone
      t.boolean :capoluogo
      t.string :region_name
      t.string :plate_slug
      t.integer :population

      t.references :county, foreign_key: true

      t.timestamps
    end
    add_index :towns, :slug,  unique: true
  end
end
