class StaticPagesController < ApplicationController
	def landing_page_obrigado
	end

	def landing_page_b2b
		@lead = Lead.new
	end

	def landing_page_b2c
		@lead = Lead.new
	end
end
