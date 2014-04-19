class RenameTypeToTypeOfAsset < ActiveRecord::Migration
  def up
    rename_column :assets, :type, :type_of_asset
  end

  def down
    rename_column :assets, :type_of_asset, :type
  end
end
