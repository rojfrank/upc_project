

class BancoController < ApplicationController

	def bcpExport
		
	end
	
	def scotiaExport
		
	end

	def bbvaExport

		id = params[:id]


		

		send_data $global_bbva,
     	:filename => "bbva.txt",
    	:type => "text/plain" 
	end

	
end
