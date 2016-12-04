module PlanillaHelper
	def index		
	end
end

class PlanillaBCP_Cabecera
	attr_accessor :id, :nro_cuenta, :moneda, :total, :fecha, :concep, :checksum, :nro_registros, :valor1, :valor2, :valor3,
								:detalle 
	def initialize
		
	end
end


class PlanillaBCP_Detalle
	attr_accessor :id, :nro_cuenta, :nombre, :moneda, :total, :concep, :valor1, :tipident, :nroident, :valor2, :valor3
	def initialize		

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
end

class BancoDetalle
	attr_accessor :nrocuenta,:empleado,:dni,:moneda,:importe,:glosa
	def initialize
		
	end
end

class	BancoBCP < Banco
	def build
		
	end
end

class	BancoScotia < Banco
	def build
		
	end
end

class	BancoBBVA < Banco
	def build
		
	end
end


