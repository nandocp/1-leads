class AddColumnToLead < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :b2b, :boolean, :default => false
    add_column :leads, :b2c, :boolean, :default => false
  end
end
