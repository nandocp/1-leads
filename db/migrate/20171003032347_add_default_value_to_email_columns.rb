class AddDefaultValueToEmailColumns < ActiveRecord::Migration[5.1]
  def change
  	change_column :leads, :email_pessoal, :string, :default => ""
  	change_column :leads, :email_corp, :string, :default => ""
  end
end
