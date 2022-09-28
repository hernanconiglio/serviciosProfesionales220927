import profesionales.*
import universidad.*
import solicitantes.*
import servicios.*

class EmpresaDeServicios {
	const profesionales = #{}
	var property honorarioDeReferencia
	const property servicios = []
	
	method darServicio(solicitante) {
		if(!self.puedeSatisfacerA(solicitante)) self.error("no puede dar el servicio")
		self.agregarServicio(solicitante)
	}
	method agregarServicio(solicitante){
		var prof = profesionales.anyOne()
		servicios.add(
			new Servicio(profesional=prof,honorariosCobrados=prof.honorariosPorHora(),solicitante=solicitante)
		)
	}
	method cantidadDeClientes() = self.clientes().asSet().size()
	
	method clientes() {
		return servicios.map({s=>s.solicitante()})
	}
	 
	method agregarServicios(unaLista) {servicios.addAll(unaLista)}
	method agregarProfesional(unProf) {profesionales.add(unProf)}
	method cantidadQueEstudiaronEn(unaUniversidad) = 
		profesionales.count({p=>p.universidad()==unaUniversidad})
		
	method profesionalesCaros() = 
		profesionales.filter({p=>p.honorariosPorHora()>honorarioDeReferencia})
	
	method universidadesFormadoras() = 
		profesionales.map({p=>p.universidad()}).asSet()
		
	method provinciasDondePodriaTrabajar() =
		profesionales.map({p=>p.provinciasDondePuedeTrabajar()}).flatten().asSet()
		
	method profesionalMasBarato() = profesionales.min({p=>p.honorariosPorHora()})
	
	method esGenteAcotada() = 
		not profesionales.any({p=>p.provinciasDondePuedeTrabajar().size() > 3})
		
	method esGenteAcotadaConAll() =
		profesionales.all({p=>p.provinciasDondePuedeTrabajar().size() <= 3})
		
	method puedeSatisfacerA(unSolicitante) = 
		profesionales.any({p=>unSolicitante.puedeSerAtendidoPor(p)}) 
	
	
}
