class AddDefaultValueToTipo < ActiveRecord::Migration[5.1]
  def change
    change_column :leads, :tipo, :string, default: "b2c"
  end
end
