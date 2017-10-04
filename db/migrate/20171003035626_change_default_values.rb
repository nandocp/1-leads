class ChangeDefaultValues < ActiveRecord::Migration[5.1]
  def change
  	change_column :leads, :email_pessoal, :string, :default => nil
  	change_column :leads, :email_corp, :string, :default => nil
  end
end
