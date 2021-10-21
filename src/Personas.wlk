import Marcas.*
import Carpas.*

class Persona {
	const jarrasCompradas = [] //jarras
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


