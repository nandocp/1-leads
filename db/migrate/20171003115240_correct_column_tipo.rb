class CorrectColumnTipo < ActiveRecord::Migration[5.1]
  def change
    change_column :leads, :tipo, :string, default: nil
  end
end
