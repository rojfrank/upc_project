require 'date'

module PlanillaHelper
	def index		
	end
end

#Clases de bancos
class	Banco 
	attr_accessor :id,:fecha,:planilla,:detalle,:generado
	def initialize
		@detalle = Array.new
		@generado = false
	end

	def total
		suma = 0
		@detalle.each do |det|
			suma += det.importe
		end
		return suma
	end

	def cantidad_items
		return @detalle.size
	end
end

class BancoDetalle
	attr_accessor :nrocuenta,:empleado,:dni,:moneda,:importe,:glosa
	def initialize
		
	end
end

#Clases de bancos
class	BancoBCP < Banco
	def build
		cab = PlanillaBCP_Cabecera.new(self.total,self.planilla,1,self.cantidad_items)
		i = 1
		@detalle.each do |det|
			detalle = PlanillaBCP_Detalle.new(i,det.nrocuenta,det.empleado,det.moneda,det.importe,det.glosa,det.dni)
			cab.detalle.push(detalle)
			i += 1
		end
		return cab.to_txt		
	end
end

class	BancoScotia < Banco
	def build
		cab = PlanillaScotia_Cabecera.new(self.total,self.planilla,1,self.cantidad_items)
		i = 1
		@detalle.each do |det|
			detalle = PlanillaScotia_Detalle.new(i,det.nrocuenta,det.empleado,det.moneda,det.importe,det.glosa,det.dni)
			cab.detalle.push(detalle)
			i += 1
		end
		return cab.to_txt			
	end
end

class	BancoBBVA < Banco
	def build
		cab = PlanillaBBVA_Cabecera.new(self.total,self.planilla,1,self.cantidad_items)
		i = 1
		@detalle.each do |det|
			detalle = PlanillaBBVA_Detalle.new(i,det.nrocuenta,det.empleado,det.moneda,det.importe,det.glosa,det.dni)
			cab.detalle.push(detalle)
			i += 1
		end
		return cab.to_txt			
	end
end


