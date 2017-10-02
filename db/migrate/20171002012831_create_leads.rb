class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
  		t.string :ipv_4
  		t.string :primeiro_nome
  		t.string :ultimo_nome
  		t.string :email_pessoal
  		t.string :email_corp

      t.timestamps
    end
  end
end
