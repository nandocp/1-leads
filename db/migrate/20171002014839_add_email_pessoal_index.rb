class AddEmailPessoalIndex < ActiveRecord::Migration[5.1]
  def change
  	change_table :leads do |t|
  		t.index :email_pessoal, unique: true
  	end
  end
end
