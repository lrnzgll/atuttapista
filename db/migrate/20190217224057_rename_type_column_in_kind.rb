class RenameTypeColumnInKind < ActiveRecord::Migration[5.2]
  def change
    rename_column(:kinds, :type, :name)
  end
end
