require 'csv'
require 'planilla_helper.rb'

class PlanillaController < ApplicationController
	
	def index
		if $global_BCP == nil 
			$global_BCP = Array.new
		end

		if $global_Scotia == nil 
			$global_Scotia = Array.new
		end

		if $global_BBVA == nil 
			$global_BBVA = Array.new
		end
	end

	def import
		myfile = params[:file]
		@csv_data = CSV.read(myfile.path , { headers: true, converters: :numeric})

		banBCP = BancoBCP.new
		banBCP.fecha = DateTime.now
		
		banScotia = BancoScotia.new
		banScotia.fecha = DateTime.now
		
		banBBVA = BancoBBVA.new
		banBBVA.fecha = DateTime.now

	  @csv_data.each do |row|
			
			banco = row[0]
			planilla = row[1]

			detalle = BancoDetalle.new
			detalle.nrocuenta	= row[2]
			detalle.empleado	= row[3]
			detalle.dni				= row[4]
			detalle.moneda		= row[5]
			detalle.importe		= row[6]
			detalle.glosa			= row[7]

			if banco == "BCP"
				banBCP.planilla = planilla
				banBCP.detalle.push(detalle)				
			elsif banco == "SCOTIA"
				banScotia.planilla = planilla
				banScotia.detalle.push(detalle)
			elsif banco == "BBVA"
				banBBVA.planilla = planilla
				banBBVA.detalle.push(detalle)
			end
			
		end 

		if banBCP.detalle.size > 0
			banBCP.id = $global_BCP.size + 1
			$global_BCP.push(banBCP)
		end

		if banScotia.detalle.size > 0
			banScotia.id = $global_Scotia.size + 1
			$global_Scotia.push(banScotia)
		end

		if banBBVA.detalle.size > 0
			banBBVA.id = $global_BBVA.size + 1
			$global_BBVA.push(banBBVA)
		end

  end	
end