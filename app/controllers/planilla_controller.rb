require 'csv'

class PlanillaController < ApplicationController
	def index		
		
	end

	def import
		myfile = params[:file]  		
    @rowarraydisp = CSV.read(myfile.path)
   	
 	  # send_data @rowarraydisp,
    # 	:filename => "holahola.csv",
    # 	:type => "text/plain"
    	
	end	
end