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
			persona.comprarJarra(new Jarra(capacidad = capacidadJarra,marca = self.marca(), seSirvioEnLaCarpa = self ,precioQueSeVendio= capacidadJarra*self.precioPorLitro()))
		}
		
	}
	
	method cantidadEbriosEmpedernidos() = self.personasInterior().count{ p => p.esEmpedernido()}
	
	// REQUERIMIENTOS AVANZADOS
	method esCarpaHomogenea() =   if (personasInterior.size() > 0) personasInterior.all({ e => e.nacionalidad() == personasInterior.first().nacionalidad()}) else  false
	
	method noSeSirvioCerveza() = personasInterior.map{ p => !p.comproCervezasEn(self)}
	//Bonus - precio de venta
	method aplicaRecargoPorEbriedad() = personasInterior.count{ p => p.estaEbria()} > personasInterior.size()*0.75
	method precioPorLitro(){
		var precio = self.marca().precioPorLitro() *1.3
		if(personasInterior.size() >= personasInterior.size()/2){
			precio*=1.40
		}else{
			precio*=1.20
		}
		if(self.aplicaRecargoPorEbriedad()){
			precio*=1.5
		}else{
			precio*=1.2
		}
	return precio
	}
	
}