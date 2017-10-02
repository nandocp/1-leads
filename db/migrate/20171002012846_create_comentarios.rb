class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
    	t.string :comentador # eu sei que é comentarista, mas comentarista é quase um dementador
    	t.text :comentario
    	t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
