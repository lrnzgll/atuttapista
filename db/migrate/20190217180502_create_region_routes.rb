class CreateRegionRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :region_routes do |t|
      t.references :region, foreign_key: true
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
