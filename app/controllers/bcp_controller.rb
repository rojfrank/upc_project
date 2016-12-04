class BcpController < ApplicationController
  def view
  end

  def export
  	id = params[:id]

		@banco = buscar_banco($global_BCP,id.to_i)

		@banco.generado = true		

		send_data @banco.build,
     	:filename => "bcp " + @banco.fecha.strftime("%Y-%m-%d") + " " + @banco.planilla + ".txt",
     	:type => "text/plain" 
  end
end
