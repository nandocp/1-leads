class Changeipv4ColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :leads, :ipv_4, :ip
  end
end
