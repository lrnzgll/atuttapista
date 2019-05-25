class AddViewsCounterToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :views_counter, :integer, default: 0 
  end
end
