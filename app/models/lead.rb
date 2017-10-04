class Lead < ApplicationRecord
  require 'ipaddr'
  require 'socket'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A([^\d\W]|[-])*\Z/ # ^[\\p{L} .'-]+$

	# callbacks
  before_validation :ipv4_set
	before_validation :primeiro_nome_correto
  before_validation :ultimo_nome_correto
        before_save :b2b_b2c

	# validações || REFATORAR
	validates :primeiro_nome, presence: { message: "! Digite seu nome !" },
                              format: { with: VALID_NAME_REGEX }
	validates :ultimo_nome, presence: { message: "! Digite seu nome !" },
                            format: { with: VALID_NAME_REGEX }
	validates :email, presence: { message: "! Digite um e-mail válido !" },
                      length: { maximum: 255 },
                			format: { with: VALID_EMAIL_REGEX }
  	# métodos de validação e callback
    def ipv4_set
      a = Socket.ip_address_list.detect{ |i|i.ipv4_private? }
      self.ip = a.ip_address
    end

  	def primeiro_nome_correto
      nome = self.primeiro_nome.split
      c = 0
      a = []
      while c <= nome.length - 1
        a << nome[c].capitalize
        c += 1
      end
      self.primeiro_nome = a.join(" ")
    end

  	def ultimo_nome_correto
      nome = self.ultimo_nome.split
      c = 0
      a = []
      while c <= nome.length - 1
        a << nome[c].capitalize
        c += 1
      end
      self.ultimo_nome = a.join(" ")
    end
    
    def b2b_b2c
      if self.tipo == "1"
        self.tipo = "B2B"
      elsif self.tipo == "0"
        self.tipo = "B2C"
      end
    end
end
