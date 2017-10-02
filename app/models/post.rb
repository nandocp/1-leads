class Post < ApplicationRecord
	validates :titulo , presence: { message: "! deve ser escolhido !" }
	validates :corpo  , presence: { message: "! não pode estar em branco !" }

	has_many :comentarios
end
