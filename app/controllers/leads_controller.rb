class LeadsController < ApplicationController
	def new
		@lead = Lead.new
	end

	def create
		@lead = Lead.new(user_params)
  	if @lead.save
  		flash[:success] = "Obrigado!"
  	else
  		flash[:error] = "Algo não funcionou" # MUDAR!
  	end
  end

	private
	  def user_params
	  	params.require(:lead).permit(:primeiro_nome,
	  															 :ultimo_nome,
	  															 :email_pessoal,
	  															 :email_corp,
	  															 :ipv_4)
	  end
end
