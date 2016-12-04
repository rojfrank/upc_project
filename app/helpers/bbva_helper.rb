module BbvaHelper
end

class PlanillaBBVA_Cabecera
	attr_accessor :id, :nro_cuenta, :moneda, :total, :fecha, :concep, :checksum, :nro_registros, :valor1, :valor2, :valor3,
								:detalle 
	def initialize(total, concep, checksum, nro_registros)
		@id = 1
		@total = total
		@concep = concep
		@checksum = checksum
		@nro_registros = nro_registros
		@nro_cuenta = '2010203010212'
		@moneda = 'PEN'
		@fecha = Date.today
		@valor1 = ''		
		@valor2 = ''
		@valor3 = ''
		@detalle = Array.new		
	end

	def to_txt
		row = id.to_s + ';' + nro_cuenta.to_s + ';' + moneda.to_s + ';' + total.to_s + ';' + fecha.to_s + ';' + 
			concep.to_s + ';' + checksum.to_s + ';' + nro_registros.to_s + ';' + valor1.to_s + ';' + valor2.to_s + ';' + valor3.to_s
		@detalle.each do |det|
			row += "\n" + det.to_txt
		end 		
		return row
	end
end

class PlanillaBBVA_Detalle
	attr_accessor :id, :nro_cuenta, :nombre, :moneda, :total, :concep, :valor1, :tipident, :nroident, :valor2, :valor3
	def initialize(id,nro_cuenta,nombre,moneda,total,concep,nroident)
		@id = id
		@nro_cuenta = nro_cuenta
		@nombre = nombre
		@moneda = moneda
		@total = total
		@concep = concep
		@valor1 = ''
		@tipident = '01'
		@nroident = nroident
		@valor2 = ''
		@valor3	= ''	
	end

	def to_txt
		return id.to_s + ';' + nro_cuenta.to_s + ';' + nombre.to_s + ';' + moneda.to_s + ';' + total.to_s + ';' + 
			concep.to_s + ';' + valor1.to_s + ';' + tipident.to_s + ';' + nroident.to_s + ';' + valor2.to_s + ';' + valor3.to_s
	end
end