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

