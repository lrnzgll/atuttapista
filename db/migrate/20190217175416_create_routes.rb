class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.text :description
      t.integer :difficulty
      t.float :distance
      t.string :gpx
      t.integer :views_counter, default: 0 
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :routes, :name
  end
end
