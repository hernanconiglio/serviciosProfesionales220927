import universidad.*

class ProfesionalAsociado {
	const property universidad
	
	method provinciasDondePuedeTrabajar() = #{"Entre Ríos", "Corrientes", "Santa Fe"} 
	
	method honorariosPorHora() = 3000
	
	method cobrar(unImporte) { asociacionDelLitoral.agregarDinero(unImporte) }
	
}


class ProfesionalVinculado {
	var property universidad

	method provinciasDondePuedeTrabajar() = #{universidad.provincia()}
	method honorariosPorHora() = universidad.honorariosPorHora()
	
	method cobrar(unImporte) {universidad.agregarDinero(unImporte*0.5)}
	
	
}


class ProfesionalLibre {
	const property universidad
	const property provinciasDondePuedeTrabajar
	var property honorariosPorHora
	var totalRecaudado = 0
	
	method cobrar(unValor) {totalRecaudado+=unValor}
	method pasarDinero(unProf,unImporte) {
		if(unImporte>totalRecaudado || unImporte<0 || unProf == self) 
			self.error("No se puede transferir ")
		unProf.cobrar(unImporte)
		self.cobrar(-unImporte)
	}
}


object asociacionDelLitoral {
	var totalRecaudado = 0
	
	method agregarDinero(unValor) { totalRecaudado += unValor }
	method totalRecaudado() = totalRecaudado
	
}