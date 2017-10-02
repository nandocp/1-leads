class Lead < ApplicationRecord
	require 'ipaddr'
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A([^\d\W]|[-])*\Z/ # ^[\\p{L} .'-]+$

	# callbacks
	before_save :correcao_primeiro_nome
  before_save :correcao_ultimo_nome

	# validações
	validates :primeiro_nome, presence: { message: "! Digite seu nome !" },
                              format: { with: VALID_NAME_REGEX }
	validates :ultimo_nome, presence: { message: "! Digite seu nome !" },
                            format: { with: VALID_NAME_REGEX }
	validates :email_pessoal, length: { maximum: 255 },
      										  format: { with: VALID_EMAIL_REGEX }
  validates :email_corp, length: { maximum: 255 },
                         format: { with: VALID_EMAIL_REGEX }
  # validates :ipv_4, presence: true

  private
  	# métodos de validação e callback
  	def correcao_primeiro_nome
      nome = self.primeiro_nome.split
      c = 0
      a = []
      while c <= nome.length - 1
        a << nome[c].capitalize
        c += 1
      end
      self.primeiro_nome = a.join(" ")
  	end

    def correcao_ultimo_nome
      nome = self.ultimo_nome.split
      c = 0
      a = []
      while c <= nome.length - 1
        a << nome[c].capitalize
        c += 1
      end
      self.ultimo_nome = a.join(" ")
    end

  	#def ipv4_valido
  	#	if self.ipv_4.ipv4? != true
  	#end
end
