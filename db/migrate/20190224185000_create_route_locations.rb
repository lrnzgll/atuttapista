class CreateRouteLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :route_locations do |t|
      t.string :name
      t.text :description
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
