class ChangeLeadsStructure < ActiveRecord::Migration[5.1]
  def change
  	remove_column :leads, :email_corp, :string
  	rename_column :leads, :email_pessoal, :email
  end
end
