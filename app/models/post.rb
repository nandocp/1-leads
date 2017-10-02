class Post < ApplicationRecord
	validates :titulo , presence: { message: "! Não pode estar em branco !" }
	validates :corpo  , presence: { message: "! Não pode estar em branco !" }

	has_many :comentarios, :dependent => :destroy
	has_many :taggings
	has_many :tags, through: :taggings
	accepts_nested_attributes_for :comentarios

	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end

	def tag_list=(tag_string)
		tag_names = tag_string.split(",").collect { |s| s.strip.downcase }.uniq
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end
end
