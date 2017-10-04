class LeadsController < ApplicationController
	def create
		@lead = Lead.new(user_params)
		@lead.save
		redirect_to obrigado_path
	end

	def report
		@leads = Lead.all
	end

	private
	  def user_params
	  	params.require(:lead).permit(:primeiro_nome,
																 	 :ultimo_nome,
																 	 :email,
																	 :tipo)
	  end
end