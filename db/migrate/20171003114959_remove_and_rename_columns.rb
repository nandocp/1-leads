class RemoveAndRenameColumns < ActiveRecord::Migration[5.1]
  def change
  	remove_column :leads, :b2b, :string
  	rename_column :leads, :b2c, :tipo
  end
end
