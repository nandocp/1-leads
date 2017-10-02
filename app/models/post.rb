class Post < ApplicationRecord
	validates :titulo , presence: { message: "! Não pode estar em branco !" }
	validates :corpo  , presence: { message: "! Não pode estar em branco !" }

	has_many :comentarios
end
