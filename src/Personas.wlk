import Marcas.*
import Carpas.*

class Persona {
	var property jarrasCompradas = [] //jarras
	var property peso = 80
	var property musicaTradicional = false
	var property nivelDeAguante = 50	
	
	method comprarJarra(jarra) = jarrasCompradas.add(jarra)
	
	method alcoholEnSangre() = jarrasCompradas.sum({ j => j.contenidoDeAlcohol() })
	
	method cantidadCompradas() = jarrasCompradas.size()
	
	method estaEbria() = self.alcoholEnSangre() * peso > self.nivelDeAguante()
	
	method leGustaLaCarpa(carpa) = self.leGusta(carpa.marca()) and carpa.hayMusica() == self.musicaTradicional()
	
	method puedeIngresarA(carpa) = self.leGustaLaCarpa(carpa) and carpa.puedeIngresar(self)
	
	method ingresarACarpa(carpa){
		if(!self.puedeIngresarA(carpa)){
			self.error("No podes ingresar amigo")
		}else{
			carpa.ingresarA(self)
		}
		
	}
	
	method esEmpedernido() = jarrasCompradas.all({j => j.capacidad() >= 1}) and self.estaEbria()
	
	method esPatriota() = jarrasCompradas.all({j => j.marca().paisFabricacion() == self.nacionalidad()})
	
	
	// REQUERIMIENTOS AVANZADOS
	method hayCoincidencia(persona) {
		const conjuntoSelfMarcas = jarrasCompradas.map({e => e.marca()}).asSet()		
		const conjuntoPersonaMarcas = persona.jarrasCompradas().map({e => e.marca()}).asSet()
		
		// TIENE QUE HABER COINCIDENCIA DE AMBOS LADOS 
		return conjuntoSelfMarcas.intersection(conjuntoPersonaMarcas).size() > conjuntoSelfMarcas.size()/2 and conjuntoPersonaMarcas.intersection(conjuntoSelfMarcas).size() > conjuntoPersonaMarcas.size()/2
	}
	method carpasDondeConsumi() = jarrasCompradas.map({j => j.seSirvioEnLaCarpa()}).asSet()
	
	method estaEntrandoEnVicio(){
		var respuesta
		if(!jarrasCompradas.isEmpty() and jarrasCompradas.size() >1){
			(1..jarrasCompradas.size()-1).forEach{ e=>
				if(jarrasCompradas.get(e).capacidad() > jarrasCompradas.get(e-1).capacidad()){
					respuesta = true
				}else{
					respuesta = false
				}
			}
		}else{
			respuesta = true
		}
		return respuesta
	}
	//Bonus - precio de venta
	method gastoTotal() = jarrasCompradas.sum{ j => j.precioQueSeVendio()}
	method jarraMasCara() = jarrasCompradas.max{ j=> j.precioQueSeVendio()}
	
	//metodo abstracto
	method leGusta(marcaCerveza)
	method nacionalidad()

}
class Belga inherits Persona{
	override method leGusta(marcaCerveza) = marcaCerveza.contenidoLupulo() > 4
	
	override method nacionalidad() = "Belga"
}
class Checo inherits Persona{
	override method leGusta(marcaCerveza) = marcaCerveza.graduacionA() > 8
	
	override method nacionalidad() = "Checa"
}

class Aleman inherits Persona{
	override method leGusta(marcaCerveza) = true
	
	override method leGustaLaCarpa(carpa) = super(carpa) and carpa.cantidadPersonas().even()
	
	override method nacionalidad() = "Alemana"
}


