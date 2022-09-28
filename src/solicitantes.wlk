import profesionales.*

class Persona {
	var property provinciaDondeVive
	
	method puedeSerAtendidoPor(unProf) = 
		unProf.provinciasDondePuedeTrabajar().contains(provinciaDondeVive)
	
}

class Institucion {
	const property universidades = #{}
	
	method agregarUniversidades(unConjunto) {universidades.addAll(unConjunto)}
	method puedeSerAtendidoPor(unProf) = 
		universidades.contains(unProf.universidad())
	
}