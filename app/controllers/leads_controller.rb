class LeadsController < ApplicationController
	def index
		@leads = Lead.all

		respond_to do | format |
			format.html
			format.csv { send_data @leads.to_csv, filename: "Grupo 10 - Gama of Thrones.csv" }
		end
	end

	def create
		@lead = Lead.new( user_params )
		@lead.save
		redirect_to obrigado_path
	end

	def report
		@leads = Lead.all
	end

	private
	  def user_params
	  	params.require( :lead ).permit( :primeiro_nome,
																 			:ultimo_nome,
																 			:email,
																			:tipo )
	  end
end