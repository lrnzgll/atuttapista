class RenameTypeColumnInSurface < ActiveRecord::Migration[5.2]
  def change
    rename_column(:surfaces, :type, :name)
  end
end
