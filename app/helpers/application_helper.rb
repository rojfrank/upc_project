module ApplicationHelper
end

def insercionDirecta(array)
	indMayor = array.size-1
	for i in 1..indMayor
		j = i-1
		while (j>=0 && array[i].id <=array[j].id)
			j=j-1
		end
		valor = array[i]
		k=i
		while k >j+1
			array[k]= array[k-1]
			k = k-1
		end
		array[j+1]= valor
	end
	return array
end

def busquedaSecuencial(array, valor)
	indMayor = array.size-1
	i=0
	indice=-1
	while i < indMayor && array[i].id < valor
		i = i+1
	end
	if array[i].id == valor
		indice = i
	end
	return indice
end

def buscar_banco(array,valor)
	if array == nil
		return nil
	else
		ordenado = insercionDirecta(array)
		indice = busquedaSecuencial(ordenado,valor)
		return ordenado[indice] 
	end
end
