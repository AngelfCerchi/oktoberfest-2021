import Marcas.*
import Personas.*
	
class Carpa{
	var property limite = 100
	var property hayMusica = false
	var property marca 
	var property personasInterior = []
	var property recargo = fijo
	
	
	method puedeIngresar(persona) = self.personasInterior().size() < self.limite() and !persona.estaEbria()
	
	method ingresarA(persona) {self.personasInterior().add(persona)} 
	
	method cantidadPersonas() = self.personasInterior().size()
	
	method servirCerveza(persona,capacidadJarra){
		if(!self.personasInterior().contains(persona)){
			self.error("Debes ingresar para luego consumir!")
		}else{
			persona.comprarJarra(new Jarra(capacidad = capacidadJarra,marca = self.marca(), seSirvioEnLaCarpa = self , precioQueSeVendio = capacidadJarra*self.precioPorLitro()))
		}
		
	}
	
	method cantidadEbriosEmpedernidos() = self.personasInterior().count{ p => p.esEmpedernido()}
	
	// REQUERIMIENTOS AVANZADOS
	method esCarpaHomogenea() =   personasInterior.all({ p => p.nacionalidad() == personasInterior.first().nacionalidad()}) 
	
	method noSeSirvioCerveza() = personasInterior.map{ p => !p.comproCervezasEn(self)}
	//Bonus - precio de venta
	
	method precioPorLitro() = recargo.precio(marca.precioPorLitro())
	
}

// TIPOS DE RECARGOS
object fijo{
	method precio(precio) = precio*1.30
}
object cantidad{
	method precio(carpa,precio) = if (carpa.personasInterior().size()  >= carpa.personasInterior().size()/2) precio*1.4 else precio*1.25
}
object ebriedad{
	method precio(carpa,precio) = if (carpa.personasInterior().count{ p => p.estaEbria()} > carpa.personasInterior().size()*0.75) precio*1.5 else precio*1.2
}
