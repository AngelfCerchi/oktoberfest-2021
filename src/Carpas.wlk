import Marcas.*
import Personas.*
	
class Carpa{
	var property limite = 100
	var property hayMusica = false
	var property marca 
	var property personasInterior = []
	
	
	method puedeIngresar(persona) = self.personasInterior().size() < self.limite() and !persona.estaEbria()
	
	method ingresarA(persona) {self.personasInterior().add(persona)} 
	
	method cantidadPersonas() = self.personasInterior().size()
	
	method servirCerveza(persona,capacidadJarra){
		if(!self.personasInterior().contains(persona)){
			self.error("Debes ingresar para luego consumir!")
		}else{
			persona.comprarJarra(new Jarra(capacidad = capacidadJarra,marca = self.marca(), seSirvioEnLaCarpa = self))
		}
		
	}
	
	method cantidadEbriosEmpedernidos() = self.personasInterior().count{ p => p.esEmpedernido()}
	
	// REQUERIMIENTOS AVANZADOS
	method esCarpaHomogenea() =   if (personasInterior.size() > 0) personasInterior.all({ e => e.nacionalidad() == personasInterior.first().nacionalidad()}) else  false
	
	
	
}