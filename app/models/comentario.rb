class Comentario < ApplicationRecord
	validates :comentador , presence: { message: "! digite seu nome !" }
	validates :comentario , presence: { message: "! digite seu comentário de luz ! <3" }

	belongs_to :post
end
