class CreateCountyRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :county_routes do |t|
      t.references :county, foreign_key: true
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
