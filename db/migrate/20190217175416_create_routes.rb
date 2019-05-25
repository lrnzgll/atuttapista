class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.text :description
      t.integer :difficulty
      t.float :distance
      t.string :gpx

      t.timestamps
    end
  end
end
