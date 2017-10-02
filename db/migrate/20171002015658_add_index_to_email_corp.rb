class AddIndexToEmailCorp < ActiveRecord::Migration[5.1]
  def change
  	change_table :leads do |t|
  		t.index :email_corp, unique: true
  	end
  end
end
