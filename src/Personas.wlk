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
	method marcasCompradas()= jarrasCompradas.map({j => j.marca()}).asSet()
	method marcasCompatibles(otraPersona)= self.marcasCompradas().intersection(otraPersona.marcasCompradas()).size()
	method marcasDiferentes(otraPersona)= self.marcasCompradas().difference(otraPersona.marcasCompradas()).size()
	
	method sonCompatibles(otraPersona)=  self.marcasCompatibles(otraPersona) > self.marcasDiferentes(otraPersona)
	
	
	method carpasDondeConsumi() = jarrasCompradas.map({j => j.seSirvioEnLaCarpa()}).asSet()
	

	method mayorQueAnterior(n){
		return jarrasCompradas.get(n).capacidad() >= jarrasCompradas.get(n-1).capacidad()
	}
	method estaEntrandoEnVicio(){
		const listaAux = []
		if(jarrasCompradas.size() == 0){
			return false
		}else{
			if (jarrasCompradas.size() > 1){
			(1..jarrasCompradas.size()-1).forEach{ pos => listaAux.add(self.mayorQueAnterior(pos))}
			return listaAux.size() == jarrasCompradas.size()-1
		}else{
			return false			
		}
		}
	}

	//
	method comproCervezasEn(carpa) = jarrasCompradas.any{ j => j.seSirvioEnLaCarpa() == carpa }
	
	//Bonus - precio de venta
	method gastoTotal() = jarrasCompradas.sum{ j => j.precioQueSeVendio() }
	method jarraMasCara() = jarrasCompradas.max{ j=> j.precioQueSeVendio() }
	
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


